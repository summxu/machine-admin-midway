/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-04-01 12:23:20
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { InjectEntityModel } from '@midwayjs/orm';
import { BaseService } from 'midwayjs-cool-core';
import { Repository } from 'typeorm';
import { WorkOrderEntity } from '../entity/workorder';
import { v1 as uuid } from 'uuid';
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
    param.orderNum = uuid().toUpperCase()
    param.status = 1
    // 推送到对应的联系人微信（暂无）
    this.workOrderEntity.save(param)
    return 'push success'
  }
}
