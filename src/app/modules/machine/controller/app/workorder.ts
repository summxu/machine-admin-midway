/*
 * @Author: Chenxu
 * @Date: 2021-03-30 16:12:58
 * @LastEditTime: 2021-03-30 17:23:37
 * @Msg: Nothing
 */
import { ALL, Body, Inject, Post, Provide } from '@midwayjs/decorator';
import { CoolController, BaseController } from 'midwayjs-cool-core';
import { WorkOrderEntity } from '../../entity/workorder';
import { WorkOrderService } from '../../service/workorder';
import { v1 as uuid } from 'uuid';
import { Context } from 'egg';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: WorkOrderEntity,
  service: WorkOrderService,
  insertParam: (ctx: Context) => {
    return {
      orderNum: uuid().toUpperCase()
    }
  },
  pageQueryOp: {
    fieldEq: ['status'],
  }
})
export class WorkOrderAppController extends BaseController {
  @Inject()
  workOrderService: WorkOrderService;

  /**
  * 生成工单
  * @param workOrder
  */
  @Post('/login')
  async login(@Body(ALL) workOrder: WorkOrderEntity) {
    return this.ok(await this.workOrderService.generate(workOrder));
  }
}