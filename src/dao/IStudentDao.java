package dao;

import java.util.List;

import domain.Student;


/**
 * 学生信息Dao
 * @author jalena 
 */
public interface IStudentDao {
	/**
	 * 添加学生
	 * 
	 * @param bean 学生对象
	 */
	public void add(Student bean);

	/**
	 * 查询所有学生
	 */
	public List<Student> findALl();

	/**
	 * 根据身份证查询学生
	 * 
	 * @param IDCard 身份证号
	 * @return 学生Bean
	 */
	public Student findByIdCard(String IDCard);

	/**
	 * 修改用户密码
	 * 
	 * @param password
	 */
	public void updatePWD(String IDCard,String password);
}
