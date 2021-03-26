/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-03-26 18:03:52
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { BaseService } from 'midwayjs-cool-core';
import { InjectEntityModel } from '@midwayjs/orm';
import { DeviceEntity } from "../entity/device";
import { Repository } from 'typeorm';

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
    const deviceInfo = await this.deviceEntity.findOne({
      select:['id','maintainer'],
      where: { id },
      relations: ['maintainer']
    })

    return deviceInfo
  }
}
