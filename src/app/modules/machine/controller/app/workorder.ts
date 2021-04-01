/*
 * @Author: Chenxu
 * @Date: 2021-03-30 16:12:58
 * @LastEditTime: 2021-04-01 11:59:50
 * @Msg: Nothing
 */
import { ALL, Body, Inject, Post, Provide } from '@midwayjs/decorator';
import { BaseController, CoolController } from 'midwayjs-cool-core';
import { WorkOrderEntity } from '../../entity/workorder';
import { WorkOrderService } from '../../service/workorder';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: WorkOrderEntity,
  service: WorkOrderService
})
export class WorkOrderAppController extends BaseController {
  @Inject()
  workOrderService: WorkOrderService;

  /**
  * 生成工单
  * @param workOrder
  */
  @Post('/generate')
  async generate(@Body(ALL) workOrder: WorkOrderEntity) {
    return this.ok(await this.workOrderService.generate(workOrder));
  }
}