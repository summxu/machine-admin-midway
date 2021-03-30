/*
 * @Author: Chenxu
 * @Date: 2021-03-30 15:27:33
 * @LastEditTime: 2021-03-30 16:54:40
 * @Msg: Nothing
 */
import { EntityModel } from '@midwayjs/orm';
import { BaseEntity } from 'midwayjs-cool-core';
import { Column, ManyToOne } from 'typeorm';
import { DeviceEntity } from './device';

/**
 * 描述
 */
@EntityModel('workorder')
export class WorkOrderEntity extends BaseEntity {
  @Column({ comment: '工单号' })
  orderNum: string;

  @Column({ comment: '错误码' })
  code: string;

  // 对应设备
  @ManyToOne((type) => DeviceEntity, (deivce) => deivce.workorder)
  device: string;

  @Column({ comment: '工单状态(1.待处理 2.正在处理 3.待审核 4.处理完成 5.失效)' })
  status: number;

  @Column({ comment: '备注', nullable: true })
  remark: string;

}
