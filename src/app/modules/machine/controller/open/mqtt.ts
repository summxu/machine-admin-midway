/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:23:04
 * @LastEditTime: 2021-03-24 09:34:33
 * @Msg: Nothing
 */
import { ALL, Body, Inject, Post, Provide } from '@midwayjs/decorator';
import { BaseController, CoolController } from 'midwayjs-cool-core';
import { WorkOrderCodeEntity } from '../../entity/workorder_code';
import { MqttService } from '../../service/mqtt';

interface msgType {
  clientid: String //客户端标识符
  payload: String //	Required		消息正文
  topic?: String	 // Optional		主题，与 topics 至少指定其中之一
  topics?: String	 //Optional		以 , 分割的多个主题，使用此字段能够同时发布消息到多个主题
  encoding?: String	//Optional	plain	消息正文使用的编码方式，目前仅支持 plain 与 base64 两种
  qos: Number	//Optional	0	QoS 等级
  retain: Boolean	//Optional	false	是否为保留消息
}

@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: WorkOrderCodeEntity,
})
/**
 * 描述
 */
export class MqttAppController extends BaseController {
  @Inject()
  mqttService: MqttService;

  /**
  * 接受webhook消息
  */
  @Post('/webhook')
  async webhook(@Body(ALL) params) {
    return this.ok(await this.mqttService.webhook(params));
  }

  /**
  * 发送订阅消息
  * @param topic // 客户端id
  * @param payload // 参数
  */
  @Post('/sendmsg')
  async sendmsg(@Body(ALL) params: msgType) {
    return this.ok(await this.mqttService.sendmsg(params));
  }
}