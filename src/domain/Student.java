package domain;

import java.util.List;

/**
 * 学生信息
 * 
 * @author jalena
 */
public class Student {

	public Student() {
		super();
	}

	/** ID */
	private int ID;
	/** 用户密码 */
	private String pwd = "666666";
	/** 学号 */
	private String stuNum;
	/** 身份证 */
	private String IDCard;
	/** 学生姓名 */
	private String name;
	/** 院系 */
	private String department;
	/** 年级 */
	private String grade;
	/** 班级 */
	private String sClass;
	/** 方向 */
	private String direction;
	/** 学制 */
	private String educationalSystem;
	/** 缴费信息集合 */
	private List<PayInfor> payList;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getIDCard() {
		return IDCard;
	}

	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getsClass() {
		return sClass;
	}

	public void setsClass(String sClass) {
		this.sClass = sClass;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getEducationalSystem() {
		return educationalSystem;
	}

	public void setEducationalSystem(String educationalSystem) {
		this.educationalSystem = educationalSystem;
	}

	public List<PayInfor> getPayList() {
		return payList;
	}

	public void setPayList(List<PayInfor> payList) {
		this.payList = payList;
	}

	public String getStuNum() {
		return stuNum;
	}

	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}

}
