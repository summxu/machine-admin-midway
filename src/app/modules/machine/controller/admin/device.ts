/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:23:04
 * @LastEditTime: 2021-03-28 10:12:43
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { CoolController, BaseController } from 'midwayjs-cool-core';
import { DeviceEntity } from "../../entity/device";
import { BaseSysUserEntity } from "../../../base/entity/sys/user";
import { DeviceService } from '../../service/device';
import { Context } from 'egg';

/**
 * 描述
 */
@Provide()
@CoolController({
  api: ['add', 'delete', 'update', 'info', 'list', 'page'],
  entity: DeviceEntity,
  service: DeviceService,
  insertParam: (ctx => {
    return {
      user: ctx.admin.userId
    }
  }),
  pageQueryOp: {
    keyWordLikeFields: ['name', 'channelName'],
    fieldEq: ['status'],
    select: ['a.*', 'b.name as userName', 'c.name as maintainerName'],
    where: async (ctx: Context) => {
      return [
        ['userId = :userId or maintainerId = :maintainerId', {
          userId: ctx.admin.userId,
          maintainerId: ctx.admin.userId
        }]
      ]
    },
    leftJoin: [
      {
        entity: BaseSysUserEntity,
        alias: 'b',
        condition: 'a.userId = b.id',
      }, {
        entity: BaseSysUserEntity,
        alias: 'c',
        condition: 'a.maintainerId = c.id',
      },
    ],
  },
})
export class DeviceAdminController extends BaseController { }
