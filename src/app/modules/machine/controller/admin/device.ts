/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:23:04
 * @LastEditTime: 2021-10-16 14:56:30
 * @Msg: Nothing
 */
import { ALL, Body, Inject, Post, Provide } from '@midwayjs/decorator';
import { Context } from 'egg';
import { BaseController, CoolController } from 'midwayjs-cool-core';
import { DeviceEntity } from "../../entity/device";
import { DeviceService } from '../../service/device';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: DeviceEntity,
  service: DeviceService,
  insertParam: (ctx: Context) => {
    return {
      user: ctx.admin.userId
    }
  },
})
export class DeviceAdminController extends BaseController {
  @Inject()
  deviceService: DeviceService;

  /**
  * 接受webhook消息
  */
  @Post('/sendParams')
  async webhook(@Body(ALL) params) {
    return this.ok(await this.deviceService.sendParams);
  }
 }
