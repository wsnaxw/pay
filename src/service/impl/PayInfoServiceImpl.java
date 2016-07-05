package service.impl;

import java.util.List;

import dao.IPayInforDao;
import dao.impl.PayInforDaoImpl;
import domain.PayInfor;
import service.IPayInfoService;

public class PayInfoServiceImpl implements IPayInfoService {
	
	IPayInforDao dao = new PayInforDaoImpl();

	@Override
	public void add(PayInfor bean) {
		dao.add(bean);
	}

	@Override
	public List<PayInfor> findByIdCard(String IDCard) {
		return dao.findByIdCard(IDCard);
	}

}
