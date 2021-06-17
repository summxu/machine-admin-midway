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
  code: String //	Required		消息正文
  topic: String	 // Optional		主题，与 topics 至少指定其中之一
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
    return this.ok(await this.mqttService.webhook);
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