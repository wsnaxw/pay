package dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IManagerDao;
import domain.Manager;


public class ManagerDaoImpl extends BaseDao implements IManagerDao {

	@Override
	public void add(Manager bean) {
		super.setConnection();

		try {
			ps = conn.prepareStatement("insert into Manager(userName,userPwd,email) values (?,?,?)");
			ps.setString(1, bean.getUserName());
			ps.setString(2, bean.getUserPwd());
			ps.setString(3, bean.getEmail());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}
	}

	@Override
	public Manager findUser(String userName, String userPwd) {

		Manager bean = null;
		super.setConnection();

		try {
			ps = conn.prepareStatement("select * from Manager where userName = ? and userPwd = ?");
			ps.setString(1, userName);
			ps.setString(2, userPwd);
			rs = ps.executeQuery();

			if (rs.next()) {
				bean = new Manager();
				bean.setID(rs.getInt("ID"));
				bean.setUserName(rs.getString("userName"));
				bean.setUserPwd(rs.getString("userPwd"));
				bean.setEmail(rs.getString("email"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}

		return bean;
	}

	@Override
	public void updatePwd(String userName, String newPwd) {

		super.setConnection();

		try {
			ps = conn.prepareStatement("update Manager set userPwd = ? where userName = ?");
			ps.setString(1, newPwd);
			ps.setString(2, userName);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}
	}

	@Override
	public List<Manager> findAll() {

		List<Manager> list = new ArrayList<Manager>();

		super.setConnection();

		try {
			ps = conn.prepareStatement("select * from Manager");
			rs = ps.executeQuery();

			while (rs.next()) {
				Manager bean = new Manager();
				bean.setID(rs.getInt("ID"));
				bean.setUserName(rs.getString("userName"));
				bean.setUserPwd(rs.getString("userPwd"));
				bean.setEmail(rs.getString("email"));
				list.add(bean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}

		return list;
	}

}
