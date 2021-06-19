import { Provide } from '@midwayjs/decorator';
import { BaseService } from 'midwayjs-cool-core';
import { InjectEntityModel } from '@midwayjs/orm';
import { Repository } from 'typeorm';
import { InstructEntity } from '../entity/instruct';

/**
 * 描述
 */
@Provide()
export class InstructService extends BaseService {
  @InjectEntityModel(InstructEntity)
  instructEntity: Repository<InstructEntity>;

  async list(params) {
    this.entity = this.instructEntity
    const tempList = await super.list(params, {})
    return tempList.filter(item => item.type == params.type)
  }

  /**
   * 查询表里是否有代码
   * @params clientid
   */
  async has({code,type}) {
    const instructInfo = await this.instructEntity
      .createQueryBuilder('instruct')
      .select(['instruct.*'])
      .where({ code ,type})
      .getRawOne()
    return instructInfo
  }
}
