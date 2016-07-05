package service.impl;

import java.util.List;

import dao.IManagerDao;
import dao.impl.ManagerDaoImpl;
import domain.Manager;
import service.IManagerService;

public class ManagerServiceImpl implements IManagerService {

	IManagerDao dao = new ManagerDaoImpl();

	@Override
	public void add(Manager bean) {
		dao.add(bean);
	}

	@Override
	public Manager findUser(String userName, String userPwd) {
		return dao.findUser(userName, userPwd);
	}

	@Override
	public void updatePwd(String userName, String newPwd) {
		dao.updatePwd(userName, newPwd);
	}

	@Override
	public List<Manager> findAll() {
		return dao.findAll();
	}
	
//	public static void main(String[] args) {
//
//		IManagerService service = new ManagerServiceImpl();
//
//		for (Manager bean : service.findAll()) {
//			System.out.println(bean.getUserName());
//			System.out.println(bean.getUserPwd());
//			System.out.println(bean.getEmail());
//		}
//	}

}
