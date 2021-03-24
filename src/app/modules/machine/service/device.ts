/*
 * @Author: Chenxu
 * @Date: 2021-03-23 17:00:33
 * @LastEditTime: 2021-03-23 17:21:07
 * @Msg: Nothing
 */
import { Provide } from '@midwayjs/decorator';
import { BaseService } from 'midwayjs-cool-core';
import { InjectEntityModel } from '@midwayjs/orm';
import { DeviceEntity} from "../entity/device";
import { Repository } from 'typeorm';

/**
 * 设备
 */
@Provide()
export class DeviceService extends BaseService {
  @InjectEntityModel(DeviceEntity)
  DeviceEntity: Repository<DeviceEntity>;

  /**
   * 描述
   */
  async xxx() {}
}
