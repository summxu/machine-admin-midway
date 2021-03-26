/*
 * @Author: Chenxu
 * @Date: 2021-03-23 10:47:00
 * @LastEditTime: 2021-03-26 15:06:15
 * @Msg: Nothing
 */
import { EggAppConfig, EggAppInfo, PowerPartial } from 'egg';

export type DefaultConfig = PowerPartial<EggAppConfig>;

export default (appInfo: EggAppInfo) => {
  const config = {} as DefaultConfig;

  config.orm = {
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: '123123',
    database: 'cool',
    // 自动建表 注意：线上部署的时候不要使用，有可能导致数据丢失
    synchronize: true,
    // 打印日志
    logging: true,
  };

  config.redis = {
    client: {
      port: 6379,          // Redis port
      host: '127.0.0.1',   // Redis host
      password: '',
      db: 0,
    }
  }

  config.logger = {
    coreLogger: {
      consoleLevel: 'INFO',
    },
  };

  return config;
};
