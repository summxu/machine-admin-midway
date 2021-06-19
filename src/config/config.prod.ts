/*
 * @Author: Chenxu
 * @Date: 2021-03-24 20:02:20
 * @LastEditTime: 2021-06-20 00:21:19
 */
import { EggAppConfig, EggAppInfo, PowerPartial } from 'egg';

export type DefaultConfig = PowerPartial<EggAppConfig>;

export default (appInfo: EggAppInfo) => {
  const config = {} as DefaultConfig;

  config.orm = {
    type: 'mysql',
    host: process.env.MYSQL_HOST || '127.0.0.1',
    port: parseInt(process.env.MYSQL_PORT || '3306'),
    username: process.env.MYSQL_USER || 'cool',
    password: process.env.MYSQL_PASSWORD || 'd6892fa4853c0537',
    database: process.env.MYSQL_DATABASE || 'machine',
    // 自动建表 注意：线上部署的时候不要使用，有可能导致数据丢失
    synchronize: false,
    // 打印日志
    logging: false,
  };

  config.logger = {
    coreLogger: {
      consoleLevel: 'ERROR',
    },
  };

  return config;
};
