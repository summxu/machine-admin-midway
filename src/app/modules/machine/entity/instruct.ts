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
@EntityModel('instruct')
export class InstructEntity extends BaseEntity {
  @Column({ comment: '指令', unique: true })
  code: string;

  @Column({ comment: '指令说明' })
  codeString: string;

  @Column({ comment: '类型 1:指令 2:上报' })
  type: number;
}
