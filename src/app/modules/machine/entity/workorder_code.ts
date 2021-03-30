/*
 * @Author: Chenxu
 * @Date: 2021-03-30 15:27:33
 * @LastEditTime: 2021-03-30 16:46:04
 * @Msg: Nothing
 */
import { EntityModel } from '@midwayjs/orm';
import { BaseEntity } from 'midwayjs-cool-core';
import { Column } from 'typeorm';

/**
 * 描述
 */
@EntityModel('workorder_code')
export class WorkOrderCodeEntity extends BaseEntity {
  @Column({ comment: '错误码',unique:true })
  code: number;

  @Column({ comment: '错误信息' })
  codeString: string;
}
