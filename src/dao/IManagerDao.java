package dao;

import java.util.List;

import domain.Manager;


public interface IManagerDao {
	/**
	 * 添加一个管理员
	 * @param bean 管理实体类
	 */
	public void add(Manager bean);
	
	/**
	 * 查询管理用户
	 * @param userName 用户名
	 * @param userPwd 用户密码
	 * @return 一个管理角色对象
	 */
	public Manager findUser(String userName,String userPwd);
	
	/**
	 * 更改管理员密码
	 * @param userName 用户名
	 * @param newPwd 用户新密码
	 */
	public void updatePwd(String userName,String newPwd);
	
	/**
	 * 查询所有管理员用户
	 * @return 管理员集合
	 */
	public List<Manager> findAll();
}
