package service.impl;

import java.util.List;

import dao.IStudentDao;
import dao.impl.StudentDaoImpl;
import domain.Student;
import service.IStudentService;

public class StudentServiceImpl implements IStudentService{
	
	IStudentDao dao = new StudentDaoImpl();

	@Override
	public void add(Student bean) {
		dao.add(bean);
	}

	@Override
	public List<Student> findALl() {
		return dao.findALl();
	}

	@Override
	public Student LoginUser(String IDCard) {
		return dao.findByIdCard(IDCard);
	}

	@Override
	public void updatePWD(String IDCard,String password) {
		dao.updatePWD(IDCard, password);
	}

}
