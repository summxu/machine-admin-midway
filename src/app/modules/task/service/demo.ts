import { Inject, Logger, Provide } from '@midwayjs/decorator';
import { BaseService } from 'midwayjs-cool-core';
import { ILogger } from '@midwayjs/logger';
import { DeviceService } from '../../machine/service/device';
import { WorkOrderService } from '../../machine/service/workorder';

/**
 * 描述
 */
@Provide()
export class TaskDemoService extends BaseService {
  @Logger()
  logger: ILogger;

  @Inject()
  deviceService: DeviceService;

  @Inject()
  workOrderService: WorkOrderService;

  /**
   * 描述
   */
  async test() {
    this.logger.info('我被调用了');
    return '任务执行成功';
  }

  // 检查设备是否维保，维保推送
  async cronPush() {
    const deviceClientids = await this.deviceService.getDeviceClientids()
    console.log(deviceClientids)
    // 查找是否有未完成的维保订单
    deviceClientids.forEach(async element => {
      if (!element.maintime) return
      const order = await this.workOrderService.isUndoneMain(element.clientid)
      if (order) {
        // 检查设备到没到维保期限
        const isTimer = new Date(element.createTime).getTime() + ((Number(element.maintime) * 24 * 60 * 60) * 1000) < new Date().getTime()
        console.log(new Date(element.createTime).getTime() + ((Number(element.maintime) * 24 * 60 * 60) * 1000), new Date().getTime())
        const isUndone = order.some(item => item.status === 1 || item.status === 2 || item.status === 3)
        if (!isUndone && isTimer) {
          this.workOrderService.generate({
            deviceId: element.clientid,
            code: '0x' + 'ff'
          })
        }
      }
    });
  }
}