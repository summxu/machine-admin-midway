/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:23:04
 * @LastEditTime: 2021-03-24 09:34:33
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { BaseController, CoolController } from 'midwayjs-cool-core';
import { DeviceEntity } from "../../entity/device";

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: DeviceEntity,
})
export class DeviceAppController extends BaseController { }