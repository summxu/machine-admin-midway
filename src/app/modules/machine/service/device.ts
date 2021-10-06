/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-10-06 15:59:15
 * @Msg: Nothing
 */
import { Inject, Provide } from '@midwayjs/decorator';
import { InjectEntityModel } from '@midwayjs/orm';
import { Context } from 'egg';
import { BaseService, ICoolCache } from 'midwayjs-cool-core';
import { Repository } from 'typeorm';
import { BaseSysUserEntity } from '../../base/entity/sys/user';
import { DeviceEntity } from "../entity/device";
import { MqttService } from './mqtt';

/**
 * 设备
 */
@Provide()
export class DeviceService extends BaseService {
  @InjectEntityModel(DeviceEntity)
  deviceEntity: Repository<DeviceEntity>;

  @Inject()
  mqttService: MqttService;

  // 注入缓存实例，该缓存实例是midwayjs-cool-core组件提供的，注入它需要加命名空间前缀
  @Inject('cool:cache')
  coolCache: ICoolCache;

  async list(params) {
    const queryOption = {
      keyWordLikeFields: ['name', 'channelName'],
      select: ['a.*', 'b.name as userName', 'c.name as maintainerName'],
      where: async (ctx: Context) => {
        if (ctx.admin.username === 'admin') return
        return [
          ['a.userId = :userId or maintainerId = :maintainerId', {
            userId: ctx.admin.userId,
            maintainerId: ctx.admin.userId
          }]
        ]
      },
      leftJoin: [
        {
          entity: BaseSysUserEntity,
          alias: 'b',
          condition: 'a.userId = b.id',
        }, {
          entity: BaseSysUserEntity,
          alias: 'c',
          condition: 'a.maintainerId = c.id',
        },
      ],
    }

    let res = await super.list(params, queryOption)
    // 获取设备在线状态
    for (let index = 0; index < res.length; index++) {
      const element = res[index];
      try {
        const status = await this.mqttService.getStatus(element.clientid)
        element.status = status
      } catch (error) {
        return error
      }
    }
    return res
  }

  async page(params) {
    const queryOption = {
      keyWordLikeFields: ['name', 'channelName'],
      select: ['a.*', 'b.name as userName', 'c.name as maintainerName'],
      where: async (ctx: Context) => {
        if (ctx.admin.username === 'admin') return
        return [
          ['a.userId = :userId or maintainerId = :maintainerId', {
            userId: ctx.admin.userId,
            maintainerId: ctx.admin.userId
          }]
        ]
      },
      leftJoin: [
        {
          entity: BaseSysUserEntity,
          alias: 'b',
          condition: 'a.userId = b.id',
        }, {
          entity: BaseSysUserEntity,
          alias: 'c',
          condition: 'a.maintainerId = c.id',
        },
      ],
    }

    let res = await super.page(params, queryOption)
    // 获取设备在线状态
    for (let index = 0; index < res.list.length; index++) {
      const element = res.list[index];
      try {
        const status = await this.mqttService.getStatus(element.clientid)
        element.status = status
      } catch (error) {
        return error
      }
    }
    // 加入设备状态
    return res
  }

  /**
   * 获取设备信息
   */
  async info(id) {
    const deviceInfo = await this.deviceEntity
      .createQueryBuilder('device')
      .select(['device.*'])
      .addSelect('device.maintainerId', 'maintainer')
      .where({ id })
      .getRawOne()

    // 获取设备其他属性
    var infrared = [1, 1, 1]
    var voltage = []
    var deviceParams = ''
    const hasInfrared = await this.coolCache.keys(`device:infrared:${deviceInfo.clientid}`)
    const hasVoltage = await this.coolCache.keys(`device:voltage:${deviceInfo.clientid}`)
    const hasDeviceParams = await this.coolCache.keys(`device:params:${deviceInfo.clientid}`)
    if (hasInfrared.length) {
      infrared = JSON.parse(await this.coolCache.get(`device:infrared:${deviceInfo.clientid}`))
    }
    if (hasVoltage.length) {
      voltage = JSON.parse(await this.coolCache.get(`device:voltage:${deviceInfo.clientid}`))
    }
    if (hasDeviceParams.length) {
      deviceParams = await this.coolCache.get(`device:deviceParams:${deviceInfo.clientid}`)
    }

    // 重新查询设备参数
    await this.mqttService.sendmsg({
      topic: String(id),
      code: '0xdb'
    })

    return { ...deviceInfo, infrared, voltage, deviceParams }
  }

  /**
   * 查询表里是否有该设备
   * @params clientid
   */
  async has(clientid) {
    const deviceInfo = await this.deviceEntity
      .createQueryBuilder('device')
      .select(['device.*'])
      .where({ clientid })
      .getRawOne()
    return deviceInfo
  }
}
