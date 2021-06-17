/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:23:04
 * @LastEditTime: 2021-04-01 10:10:44
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
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
export class DeviceAdminController extends BaseController { }
