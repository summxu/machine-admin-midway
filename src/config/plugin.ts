/*
 * @Author: Chenxu
 * @Date: 2021-03-24 20:02:20
 * @LastEditTime: 2021-06-19 23:51:10
 */
import { EggPlugin } from 'egg';
export default {
  static: true, // default is true
  view: true,
  schedule: true,
  nunjucks: {
    enable: true,
    package: 'egg-view-nunjucks',
  },
  emqtt: {
    enable: true,
    package: '../egg-emqtt',
  }
} as EggPlugin;
