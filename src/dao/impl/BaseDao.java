package dao.impl;

import java.sql.*;

/**
 * 数据库连接对象
 * @author jalena
 */
public class BaseDao {
	
	/** 连接对象 */
	protected Connection conn;
	/** 预编译SQL语句执行对象 **/
	protected PreparedStatement ps;
	/** 结果集对象 **/
	protected ResultSet rs;

	private String JDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";// SQL数据库引擎
	private String connectDB = "jdbc:sqlserver://localhost:1433;databaseName=PaySystem;integratedSecurity=true";// 连接字符串
	private String username = "sa";// 用户名
	private String password = "private";// 密码

	/**
	 * 获取Sql Server Connection
	 */
	protected void setConnection() {
		try {
			Class.forName(JDriver);
			conn = DriverManager.getConnection(connectDB, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭数据库连接
	 */
	protected void closeConnection() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}

			if (ps != null) {
				ps.close();
				ps = null;
			}

			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
}
