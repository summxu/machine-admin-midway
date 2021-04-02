/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-04-01 22:21:43
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

  /**
   * 获取工单信息
   * @param id 
   */
  async info(id) {
    const workOrderInfo = await this.workOrderEntity
      .createQueryBuilder('a')
      .select(['a.*', 'b.userId',
        'b.name as deviceName',
        'b.maintainerId as maintainerId',
        'e.codeString as codeString',
        'c.name as userName',
        'd.name as maintainerName'])
      .leftJoin('device', 'b', 'a.deviceId = b.id')
      .leftJoin('base_sys_user', 'c', 'b.userId = c.id')
      .leftJoin('base_sys_user', 'd', 'b.maintainerId = d.id')
      .leftJoin('workorder_code', 'e', 'a.code = e.code')
      .where({ id })
      .getRawOne()
    return workOrderInfo
  }
}
