/*
 * @Author: Chenxu
 * @Date: 2021-03-23 10:47:00
 * @LastEditTime: 2021-03-23 16:46:15
 * @Msg: Nothing
 */
import { EntityModel } from '@midwayjs/orm';
import { BaseEntity } from 'midwayjs-cool-core';
import { Column } from 'typeorm';

/**
 * 商品
 */
@EntityModel('demo_app_goods')
export class DemoAppGoodsEntity extends BaseEntity {
  @Column({ comment: '用户ID' })
  userId: number;

  @Column({ comment: '标题' })
  title: string;

  @Column({ comment: '图片' })
  pic: string;

  @Column({ comment: '价格', type: 'decimal', precision: 5, scale: 2 })
  price: number;

  @Column({ comment: '分类', type: 'tinyint' })
  type: number;
}
