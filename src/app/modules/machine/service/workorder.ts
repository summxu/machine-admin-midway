/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-03-30 17:23:23
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { InjectEntityModel } from '@midwayjs/orm';
import { BaseService } from 'midwayjs-cool-core';
import { Repository } from 'typeorm';
import { WorkOrderEntity } from '../entity/workorder';

/**
 * 设备
 */
@Provide()
export class WorkOrderService extends BaseService {
  @InjectEntityModel(WorkOrderEntity)
  workOrderEntity: Repository<WorkOrderEntity>;

  /**
   * 生成工单(报警)
   */
  async generate(param) {
    console.log(param)
    return 123
  }
}
