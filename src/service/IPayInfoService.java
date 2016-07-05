package service;

import java.util.List;

import domain.PayInfor;


/**
 * 缴费记录业务层
 * @author jalena
 *
 */
public interface IPayInfoService {
	/**
	 * 添加缴费记录
	 * @param bean 缴费记录对象
	 */
	public void add(PayInfor bean);
	
	/**
	 * 获取学生缴费记录集合
	 * @param IDCard 身份证号
	 * @return List 学生缴费记录
	 */
	public List<PayInfor> findByIdCard(String IDCard);
}
