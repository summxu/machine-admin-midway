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
   * 接受webhook消息
   * @params ts: 1623767069116,
  *  @params topic: 'publishserver',
  *  @params retain: false,
  *  @params qos: 0,
  *  @params payload: 'i am 002',
  *  @params node: 'emqx@127.0.0.1',
  *  @params from_username: '',
  *  @params from_client_id: 'no002',
  *  @params action: 'message_publish'
  */

  async webhook(params) {
    const { from_client_id, payload } = params
    console.log(from_client_id, payload)
    return true
  }

  /**
   * 发送消息
   */
  async sendmsg(params) {
    const data = {
      ...params,
      clientid: 'server',
      qos: 0,
      retain: false
    }
    const { res } = await this.ctx.curl('http://localhost:8081/api/v4/mqtt/publish', {
      method: 'POST',
      data: JSON.stringify(data),
      auth: 'admin:public'
    });
    return res
  }

  /**
   * 查看设备是否在线
   */
  async getStatus(clientid) {
    const { res } = await this.ctx.curl('http://localhost:8081/api/v4/mqtt/publish', {
      method: 'POST',
      data: JSON.stringify({ clientid }),
      auth: 'admin:public'
    });
    return res
  }
}

