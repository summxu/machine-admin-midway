/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-03-27 23:52:06
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { BaseService } from 'midwayjs-cool-core';

/**
 * 设备
 */
@Provide()
export class MqttService extends BaseService {
  /**
   * 接受订阅消息
  */

  async webhook(req) {
    const { topic, msg } = req
    console.log(topic, msg)
    return true
  }

  /**
   * 发送消息
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
    const { data } = await this.ctx.curl('http://82.156.12.15:8081/api/v4/clients', {
      method: 'GET',
      data: { clientid },
      auth: 'admin:public'
    });
    const res = JSON.parse(data.toString())
    return res.data.length
  }
}

