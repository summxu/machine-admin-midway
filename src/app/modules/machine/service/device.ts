/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-03-27 23:52:06
 * @Msg: Nothing
 */
import { Inject, Provide } from '@midwayjs/decorator';
import { InjectEntityModel } from '@midwayjs/orm';
import { BaseService } from 'midwayjs-cool-core';
import { Context } from 'node:vm';
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

    // 获取设备在线状态
    // const res = await this.mqttService.getStatus(deviceInfo.clientid)
    // console.log(res)
    return deviceInfo
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
