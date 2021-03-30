/*
 * @Author: Chenxu
 * @Date: 2021-03-23 16:44:33
 * @LastEditTime: 2021-03-30 16:02:24
 * @Msg: Nothing
 */
import { EntityModel } from '@midwayjs/orm';
import { BaseEntity } from 'midwayjs-cool-core';
import { Column, ManyToOne, OneToMany } from 'typeorm';
import { BaseSysUserEntity } from "../../base/entity/sys/user";
import { WorkOrderEntity } from './workorder';

/**
 * 设备
 */
@EntityModel('device')
export class DeviceEntity extends BaseEntity {
  // 创建人
  @ManyToOne((type) => BaseSysUserEntity, (user) => user.device)
  user: string;

  // 检修人
  @ManyToOne((type) => BaseSysUserEntity, (user) => user.device)
  maintainer: string;

  // 对应工单
  @OneToMany((type) => WorkOrderEntity, (workorder) => workorder.device)
  workorder: WorkOrderEntity[];

  @Column({ comment: '设备名称' })
  name: string;

  @Column({ comment: '通道名称' })
  channelName: string;

  @Column({ comment: 'MAC地址' })
  mac: string;

  @Column({ comment: '设备状态（1:在线，2:离线）' })
  status: number;
}
