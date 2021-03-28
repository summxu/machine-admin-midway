/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-03-27 23:52:06
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { InjectEntityModel } from '@midwayjs/orm';
import { BaseService } from 'midwayjs-cool-core';
import { Repository } from 'typeorm';
import { DeviceEntity } from "../entity/device";

/**
 * 设备
 */
@Provide()
export class DeviceService extends BaseService {
  @InjectEntityModel(DeviceEntity)
  deviceEntity: Repository<DeviceEntity>;

  /**
   * 获取设备信息
   */
  async info(id) {
    const deviceInfo = await this.deviceEntity
      .createQueryBuilder('device')
      .select(['device.*'])
      .addSelect('device.maintainerId', 'maintainer')
      .where({ id })
      .getRawOne()
    return deviceInfo
  }
}
