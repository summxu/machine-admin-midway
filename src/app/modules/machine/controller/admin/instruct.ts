/*
 * @Author: Chenxu
 * @Date: 2021-03-30 16:12:58
 * @LastEditTime: 2021-03-30 16:47:21
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { CoolController, BaseController } from 'midwayjs-cool-core';
import { InstructEntity } from '../../entity/instruct';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: InstructEntity,
  listQueryOp: {
    fieldEq: ['type'],
  },
  pageQueryOp: {
    fieldEq: ['type'],
    addOrderBy: { code: 'asc' }
  }
})
export class InstructAdminController extends BaseController { }
