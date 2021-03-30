/*
 * @Author: Chenxu
 * @Date: 2021-03-30 16:12:58
 * @LastEditTime: 2021-03-30 17:21:31
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { BaseController, CoolController } from 'midwayjs-cool-core';
import { WorkOrderEntity } from '../../entity/workorder';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: WorkOrderEntity,
  pageQueryOp: {
    fieldEq: ['status'],
  }
})
export class WorkOrderAdminController extends BaseController {}
