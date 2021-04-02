/*
 * @Author: Chenxu
 * @Date: 2021-03-30 16:12:58
 * @LastEditTime: 2021-04-01 21:52:36
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { Context } from 'egg';
import { BaseController, CoolController } from 'midwayjs-cool-core';
import { BaseSysUserEntity } from '../../../base/entity/sys/user';
import { DeviceEntity } from '../../entity/device';
import { WorkOrderEntity } from '../../entity/workorder';
import { WorkOrderCodeEntity } from '../../entity/workorder_code';
import { WorkOrderService } from '../../service/workorder';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: WorkOrderEntity,
  service: WorkOrderService,
  pageQueryOp: {
    select: [
      'a.*',
      'b.userId',
      'b.name as deviceName',
      'b.maintainerId',
      'e.codeString',
      'c.name as userName',
      'd.name as maintainerName'
    ],
    where: async (ctx: Context) => {
      if (ctx.admin.username === 'admin') return
      const status = ctx.request.body.status
      return [
        [`(b.userId = :userId or b.maintainerId = :maintainerId) ${status ? 'and a.status = ' + status : ''}`, {
          userId: ctx.admin.userId,
          maintainerId: ctx.admin.userId
        }]
      ]
    },
    leftJoin: [
      {
        entity: DeviceEntity,
        alias: 'b',
        condition: 'a.deviceId = b.id',
      },
      {
        entity: BaseSysUserEntity,
        alias: 'c',
        condition: 'b.userId = c.id',
      },
      {
        entity: BaseSysUserEntity,
        alias: 'd',
        condition: 'b.maintainerId = d.id',
      },
      {
        entity: WorkOrderCodeEntity,
        alias: 'e',
        condition: 'a.code = e.code',
      }
    ],
  }
})
export class WorkOrderAdminController extends BaseController { }
