/*
 * @Author: Chenxu
 * @Date: 2021-03-23 16:44:33
 * @LastEditTime: 2021-03-24 15:03:25
 * @Msg: Nothing
 */
import { EntityModel } from '@midwayjs/orm';
import { BaseEntity } from 'midwayjs-cool-core';
import { Column, ManyToOne } from 'typeorm';
import { BaseSysUserEntity } from "../../base/entity/sys/user";

/**
 * 设备
 */
@EntityModel('device')
export class DeviceEntity extends BaseEntity {

  // 绑定人员,多对一
  @ManyToOne((type) => BaseSysUserEntity, (user) => user.device)
  user: string;

  @Column({ comment: '设备名称' })
  name: string;

  @Column({ comment: '通道名称' })
  channelName: string;

  @Column({ comment: 'MAC地址' })
  mac: string;

  @Column({ comment: '设备状态（1:在线，2:离线）' })
  status: number;
}
