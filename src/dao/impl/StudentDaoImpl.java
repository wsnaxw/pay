package dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IStudentDao;
import domain.PayInfor;
import domain.Student;
import service.IPayInfoService;
import service.impl.PayInfoServiceImpl;

/**
 * 学生Dao
 * @author jalena
 *
 */
public class StudentDaoImpl extends BaseDao implements IStudentDao {

	@Override
	public void add(Student bean) {
		super.setConnection();
		try {
			ps = conn.prepareStatement(
					"INSERT INTO student ([IDCard],[name],[stuNum],[department],[grade],[sClass],[direction],[educationalSystem]) VALUES (?,?,?,?,?,?,?,?)");
			ps.setString(1, bean.getIDCard());
			ps.setString(2, bean.getName());
			ps.setString(3, bean.getStuNum());
			ps.setString(4, bean.getDepartment());
			ps.setString(5, bean.getGrade());
			ps.setString(6, bean.getsClass());
			ps.setString(7, bean.getDirection());
			ps.setString(8, bean.getEducationalSystem());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}

	}

	@Override
	public List<Student> findALl() {
		List<Student> list = new ArrayList<Student>();
		Student bean = null;

		super.setConnection();

		try {
			ps = conn.prepareStatement("select * from student");
			rs = ps.executeQuery();

			while (rs.next()) {
				bean = new Student();
				bean.setID(rs.getInt("ID"));
				bean.setStuNum(rs.getString("stuNum"));
				bean.setIDCard(rs.getString("IDCard"));
				bean.setName(rs.getString("name"));
				bean.setDepartment(rs.getString("department"));
				bean.setGrade(rs.getString("grade"));
				bean.setsClass(rs.getString("sClass"));
				bean.setDirection(rs.getString("direction"));
				bean.setEducationalSystem(rs.getString("educationalSystem"));
				list.add(bean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}

		return list;
	}

	@Override
	public Student findByIdCard(String IDCard) {
		Student bean = null;

		super.setConnection();
		List<PayInfor> list = new ArrayList<PayInfor>();
		IPayInfoService pay = new PayInfoServiceImpl();

		try {
			ps = conn.prepareStatement("select * from student where IDCard = ?");
			ps.setString(1, IDCard);
			rs = ps.executeQuery();

			if (rs.next()) {
				bean = new Student();
				bean.setID(rs.getInt("ID"));
				bean.setStuNum(rs.getString("stuNum"));
				bean.setIDCard(rs.getString("IDCard"));
				bean.setName(rs.getString("name"));
				bean.setDepartment(rs.getString("department"));
				bean.setGrade(rs.getString("grade"));
				bean.setsClass(rs.getString("sClass"));
				bean.setDirection(rs.getString("direction"));
				bean.setEducationalSystem(rs.getString("educationalSystem"));
				
				// 查询学生包含的缴费信息
				list = pay.findByIdCard(IDCard);
				bean.setPayList(list);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}

		return bean;
	}

	@Override
	public void updatePWD(String IDCard,String password) {
		super.setConnection();
		
		try {
			ps = conn.prepareStatement("update student set pwd = ? where IDcard = ?");
			ps.setString(1, password);
			ps.setString(2, IDCard);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			super.closeConnection();
		}
	}

}
