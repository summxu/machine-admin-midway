/*
 * @Author: Chenxu
 * @Date: 2021-03-23 16:42:25
 * @LastEditTime: 2021-03-23 16:44:00
 * @Msg: Nothing
 */
import { Application } from 'egg';
import { ModuleConfig } from 'midwayjs-cool-core';

/**
 * 示例
 */
export default (app: Application) => {
  return {
    // 模块名称
    name: '设备模块',
    // 模块描述
    description: '演示示例',
    // 中间件
    middlewares: [],
  } as ModuleConfig;
};
