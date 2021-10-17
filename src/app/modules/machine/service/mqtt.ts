/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-10-17 16:26:19
 * @Msg: Nothing
 */
import { Inject, Logger, Provide } from '@midwayjs/decorator';
import { BaseService, ICoolCache } from 'midwayjs-cool-core';
import { DeviceService } from './device';
import { InstructService } from './instruct';
import { WorkOrderService } from './workorder';
import { ILogger } from '@midwayjs/logger';

/**
 * 设备
 */
@Provide()
export class MqttService extends BaseService {
  @Inject()
  instructService: InstructService;

  @Inject()
  deviceService: DeviceService;

  @Inject()
  workOrderService: WorkOrderService;

  @Logger()
  logger: ILogger;

  // 注入缓存实例，该缓存实例是midwayjs-cool-core组件提供的，注入它需要加命名空间前缀
  @Inject('cool:cache')
  coolCache: ICoolCache;
  /**
   * 接受订阅消息
  */

  async webhook(req) {
    const { msg } = req
    // 收到消息字符串切割 7c7c -> ||
    if (msg.indexOf('7c7c') === -1) return
    const msg0 = msg.split('7c7c')[0]
    const msg1 = msg.split('7c7c')[1]
    const code = msg1.substring(2, 4)
    const val = msg1.substring(4, 6)
    const clientid = Buffer.from(msg0, "hex").toString()

    if (code !== 'dc') {
      const logMsg = `收到上报代码：${code}，传递的值为：${val}`
      const haslogkey = await this.coolCache.keys(`device:log:${clientid}`)
      let log = []
      if (haslogkey.length) {
        log = JSON.parse(await this.coolCache.get(`device:log:${clientid}`))
      }
      log.push(logMsg)
      await this.coolCache.set(`device:log:${clientid}`, JSON.stringify(log))
      this.logger.info(logMsg)
    }

    // 查询是否有此代码
    const hasInstruct = await this.instructService.has({ code: '0x' + code, type: 2 })
    if (!hasInstruct) return
    // 查询是否有当前设备
    const hasDevice = await this.deviceService.has(clientid)
    if (!hasDevice) return
    // 操作缓存
    // 如果为挡住红外线
    if ('0x' + code === '0xd0' || '0x' + code === '0xd4' || '0x' + code === '0xd6') {
      const haskey = await this.coolCache.keys(`device:infrared:${clientid}`)
      // 1 非法闯入（红色） 2 正常进入（绿色）3 故障（黑色） 0 未通电
      var infrared = [0, 0, 0]
      if (haskey.length) {
        infrared = JSON.parse(await this.coolCache.get(`device:infrared:${clientid}`))
      }
      // val === 0 红外未通电
      if (Number(val) === 0) {
        infrared = [0, 0, 0]
      } else {
        // 常态下触发红外线 亮红色
        if ('0x' + code === '0xd0') {
          const hexNum = Number(val).toString(2)
          const hexStr = `000${hexNum}`.slice(hexNum.length, hexNum.length + 3)
          infrared = infrared.map((item, index) => Number(hexStr[index]) ? 1 : 0)
        }
        // 开门下触发红外线 亮绿色
        if ('0x' + code === '0xd6') {
          const hexNum = Number(val).toString(2)
          const hexStr = `000${hexNum}`.slice(hexNum.length, hexNum.length + 3)
          infrared = infrared.map((item, index) => Number(hexStr[index]) ? 2 : 0)
        }
        // 红外线故障 亮黑色
        if ('0x' + code === '0xd4') {
          const hexNum = Number(val).toString(2)
          const hexStr = `000${hexNum}`.slice(hexNum.length, hexNum.length + 3)
          infrared = infrared.map((item, index) => Number(hexStr[index]) ? 3 : 0)
        }
      }

      await this.coolCache.set(
        `device:infrared:${clientid}`,
        JSON.stringify(infrared)
      );
      return
    }
    // 如果为上报电压
    if ('0x' + code === '0xd9') {
      const haskey = await this.coolCache.keys(`device:voltage:${clientid}`)
      var voltage = []
      if (haskey.length) {
        voltage = JSON.parse(await this.coolCache.get(`device:voltage:${clientid}`))
      }
      voltage.push({ value: Number(val), time: new Date() })
      await this.coolCache.set(
        `device:voltage:${clientid}`,
        JSON.stringify(voltage)
      );
      return
    }
    // 如果为上报设备参数
    if ('0x' + code === '0xdc') {
      const deviceParams = msg1.substring(4, msg1.length - 2)
      this.logger.info(`收到的上报参数为${deviceParams}`)

      await this.coolCache.set(
        `device:params:${clientid}`,
        deviceParams
      );
      return
    }
    // 创建一个工单
    this.workOrderService.generate({
      deviceId: clientid,
      code: '0x' + code
    })
    // 微信操作
    return true
  }

  /**
   * 发送消息
   * 长度：整个通讯包的长度，包括长度本身
   * 命令号：长度 1字节
   * 数据：  长度可变，规定数据包长度最小1字节，最长22字节
   * 校验：  采用异或校验 ，校验内容包括长度+命令号+数据,
   * 整个通讯包的长度最小字节数为 4字节，最长为25字节。如果数据命令没有内容，那么填充一个0~255之间的任意数据凑够4字节。为了防止误动作，程序根据 数据的内容来检测是否是发送重复命令。
   * 例如，第一次发开门命令时发送：04 a0 01 a5，程序检测并执行，第二次在发开门命令时，就不能发送同样的数据，就要把 数据01 变成其他数据，比如02，程序才执行命令，否则认为是 多发送的数据，丢弃不执行。
   */
  async sendmsg(params) {
    const app: any = this.app
    const { topic, code } = params
    const nop = Math.round(Math.random() * 16)
    const sum = parseInt('0x04', 16) ^ parseInt(code, 16) ^ nop
    const buffer = Buffer.from([0x04, code, '0x' + nop.toString(16), '0x' + sum.toString(16)]);
    // const buffer = Buffer.from([2, 32, 49, 46, 32, 192, 3, 0, 4]).toString('hex').match(/[a-z0-9][a-z0-9]/g).join(' ');

    if (code !== '0xdb') {
      const logMsg = `发送设备指令：${code}`
      const haslogkey = await this.coolCache.keys(`device:log:${topic}`)
      let log = []
      if (haslogkey.length) {
        log = JSON.parse(await this.coolCache.get(`device:log:${topic}`))
      }
      log.push(logMsg)
      await this.coolCache.set(`device:log:${topic}`, JSON.stringify(log))
      this.logger.info(logMsg)
    }

    try {
      await app.emqtt.publish(topic, buffer, { qos: 0 });
    } catch (error) {
      return new Error(error)
    }
  }

  /**
   * 查看设备是否在线
   */
  async getStatus(clientid) {
    const { data } = await this.ctx.curl('http://101.34.41.251:8081/api/v4/clients', {
      method: 'GET',
      data: { clientid },
      auth: 'admin:public'
    });
    const res = JSON.parse(data.toString())
    return res.data.length
  }

}

