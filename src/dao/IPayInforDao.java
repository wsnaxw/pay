package dao;

import java.util.List;

import domain.PayInfor;


/**
 * @author jalena
 * 缴费记录Dao
 */
public interface IPayInforDao {
	
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
