/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-06-20 08:47:45
 * @Msg: Nothing
 */
import { Inject, Provide } from '@midwayjs/decorator';
import { BaseService } from 'midwayjs-cool-core';
import { DeviceService } from './device';
import { InstructService } from './instruct';
import { WorkOrderService } from './workorder';

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
  /**
   * 接受订阅消息
  */

  async webhook(req) {
    const { msg } = req
    // 收到消息字符串切割 7c7c -> ||
    if (msg.indexOf('7c7c') === -1) return
    const msg0 = msg.split('7c7c')[0]
    const code = msg.split('7c7c')[1]
    const clientid = Buffer.from(msg0, "hex").toString()
    // 查询是否有此代码
    const hasInstruct = await this.instructService.has({ code: '0x' + code, type: 2 })
    if (!hasInstruct) return
    // 查询是否有当前设备
    const hasDevice = await this.deviceService.has(clientid)
    if (!hasDevice) return
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
    const sum = parseInt('0x04', 16) + parseInt(code, 16) + nop
    const buffer = Buffer.from([0x04, code, '0x' + nop.toString(16), '0x' + sum.toString(16)]);
    // const buffer = Buffer.from([2, 32, 49, 46, 32, 192, 3, 0, 4]).toString('hex').match(/[a-z0-9][a-z0-9]/g).join(' ');
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

