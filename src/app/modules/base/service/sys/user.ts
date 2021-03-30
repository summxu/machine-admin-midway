import { Inject, Provide } from '@midwayjs/decorator';
import { InjectEntityModel } from '@midwayjs/orm';
import * as _ from 'lodash';
import * as md5 from 'md5';
import { BaseService, CoolCommException, ICoolCache } from 'midwayjs-cool-core';
import { Repository } from 'typeorm';
import { BaseSysDepartmentEntity } from '../../entity/sys/department';
import { BaseSysUserEntity } from '../../entity/sys/user';
import { BaseSysUserRoleEntity } from '../../entity/sys/user_role';
import { BaseSysDepartmentService } from './department';
import { BaseSysPermsService } from './perms';

/**
 * 系统用户
 */
@Provide()
export class BaseSysUserService extends BaseService {
  @InjectEntityModel(BaseSysUserEntity)
  baseSysUserEntity: Repository<BaseSysUserEntity>;

  @InjectEntityModel(BaseSysUserRoleEntity)
  baseSysUserRoleEntity: Repository<BaseSysUserRoleEntity>;

  @InjectEntityModel(BaseSysDepartmentEntity)
  baseSysDepartmentEntity: Repository<BaseSysDepartmentEntity>;

  @Inject('cool:cache')
  coolCache: ICoolCache;

  @Inject()
  baseSysPermsService: BaseSysPermsService;

  @Inject()
  baseSysDepartmentService: BaseSysDepartmentService;

  /**
   * 分页查询
   * @param query
   */
  async page(query) {
    const { keyWord, status, departmentIds = [] } = query;
    const permsDepartmentArr = await this.baseSysPermsService.departmentIds(
      this.ctx.admin.userId
    ); // 部门权限
    const userPidArr = await this.recursionPIDS(query.pid); // 所有子级pid
    const sql = `
        SELECT
            a.id,a.name,a.nickName,a.headImg,a.email,a.remark,a.status,a.createTime,a.updateTime,a.username,a.phone,a.departmentId,a.pid,
            GROUP_CONCAT(c.name) AS roleName,
            d.name as departmentName
        FROM
            base_sys_user a
            LEFT JOIN base_sys_user_role b ON a.id = b.userId
            LEFT JOIN base_sys_role c ON b.roleId = c.id
            LEFT JOIN base_sys_department d on a.departmentId = d.id
        WHERE 1 = 1
            ${this.setSql(
      !_.isEmpty(departmentIds),
      'and a.departmentId in (?)',
      [departmentIds]
    )}
            ${this.setSql(status, 'and a.status = ?', [status])}
            ${this.setSql(keyWord, 'and (a.name LIKE ? or a.username LIKE ?)', [
      `%${keyWord}%`,
      `%${keyWord}%`,
    ])}
            ${this.setSql(true, 'and a.username != ?', ['admin'])}
            ${this.setSql(
      this.ctx.admin.username !== 'admin',
      'and a.pid in (?)',
      [!_.isEmpty(userPidArr) ? userPidArr : [null]]
    )}
            ${this.setSql(
      this.ctx.admin.username !== 'admin',
      'and a.departmentId in (?)',
      [!_.isEmpty(permsDepartmentArr) ? permsDepartmentArr : [null]]
    )}
        GROUP BY a.id
        `;
    return this.sqlRenderPage(sql, query);
  }

  /**
   * 移动部门
   * @param departmentId
   * @param userIds
   */
  async move(departmentId, userIds) {
    await this.baseSysUserEntity
      .createQueryBuilder()
      .update()
      .set({ departmentId })
      .where('id in (:userIds)', { userIds })
      .execute();
  }

  /**
   * 获得个人信息
   */
  async person() {
    const info = await this.baseSysUserEntity.findOne({
      id: this.ctx.admin.userId,
    });
    delete info.password;
    return info;
  }

  /**
   * 更新用户角色关系
   * @param user
   */
  async updateUserRole(user) {
    if (user.username === 'admin') {
      throw new CoolCommException('非法操作~');
    }
    await this.baseSysUserRoleEntity.delete({ userId: user.id });
    if (user.roleIdList) {
      for (const roleId of user.roleIdList) {
        await this.baseSysUserRoleEntity.save({ userId: user.id, roleId });
      }
    }
    await this.baseSysPermsService.refreshPerms(user.id);
  }

  /**
    * 更新用户部门关系
    * @param user
    */
  async updateUserDepartment(user) {
    if (user.username === 'admin') {
      throw new CoolCommException('非法操作~');
    }
    // 根据角色查询所在最顶级部门就是角色对应的部门关系
    const departments = await this.baseSysDepartmentService.getByRoleIds(user.roleIdList, false)
    return departments[0]
  }

  /**
   * 新增
   * @param param
   */
  async add(param) {
    const exists = await this.baseSysUserEntity.findOne({
      username: param.username,
    });
    if (!_.isEmpty(exists)) {
      throw new CoolCommException('用户名已经存在~');
    }
    param.password = md5('123456'); // 默认密码  建议未改密码不能登陆
    await this.baseSysUserEntity.save(param);
    await this.updateUserRole(param);
    const departmentId = await this.updateUserDepartment(param)
    this.move(departmentId, [param.id])
    return param.id;
  }

  /**
   * 根据ID获得信息
   * @param id
   */
  public async info(id) {
    const info = await this.baseSysUserEntity.findOne({ id });
    const userRoles = await this.nativeQuery(
      'select a.roleId from base_sys_user_role a where a.userId = ?',
      [id]
    );
    const department = await this.baseSysDepartmentEntity.findOne({
      id: info.departmentId,
    });
    if (info) {
      delete info.password;
      if (userRoles) {
        info.roleIdList = userRoles.map(e => {
          return parseInt(e.roleId);
        });
      }
    }
    delete info.password;
    if (department) {
      info.departmentName = department.name;
    }
    return info;
  }

  /**
   * 修改个人信息
   * @param param
   */
  public async personUpdate(param) {
    param.id = this.ctx.admin.userId;
    if (!_.isEmpty(param.password)) {
      param.password = md5(param.password);
      const userInfo = await this.baseSysUserEntity.findOne({ id: param.id });
      if (!userInfo) {
        throw new CoolCommException('用户不存在');
      }
      param.passwordV = userInfo.passwordV + 1;
      await this.coolCache.set(
        `admin:passwordVersion:${param.id}`,
        param.passwordV
      );
    } else {
      delete param.password;
    }
    await this.baseSysUserEntity.save(param);
  }

  /**
   * 修改
   * @param param 数据
   */
  async update(param) {
    if (param.id && param.username === 'admin') {
      throw new CoolCommException('非法操作~');
    }
    if (!_.isEmpty(param.password)) {
      param.password = md5(param.password);
      const userInfo = await this.baseSysUserEntity.findOne({ id: param.id });
      if (!userInfo) {
        throw new CoolCommException('用户不存在');
      }
      param.passwordV = userInfo.passwordV + 1;
      await this.coolCache.set(
        `admin:passwordVersion:${param.id}`,
        param.passwordV
      );
    } else {
      delete param.password;
    }
    if (param.status === 0) {
      await this.forbidden(param.id);
    }
    await this.baseSysUserEntity.save(param);
    await this.updateUserRole(param);
  }

  /**
   * 禁用用户
   * @param userId
   */
  async forbidden(userId) {
    await this.coolCache.del(`admin:token:${userId}`);
  }

  /**
   * 递归查询pid
   * @param pid 
   */
  async recursionPIDS(pid) {
    const sql = `
      (select t3.id from (
      select t1.id,
      if(find_in_set(pid, @pids) > 0, @pids := concat(@pids, ',', id), 0) as ischild
      from (
      select * from base_sys_user t order by t.id asc
      ) t1,
      (select @pids := ?) t2
      ) t3 where ischild != 0 or id = ?)
    `
    const arr = await this.nativeQuery(sql, [pid, pid])
    return arr.map(item => item.id)
  }
}
