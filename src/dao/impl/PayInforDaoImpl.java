package dao.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IPayInforDao;
import domain.PayInfor;

/**
 * 缴费信息DAO
 * @author jalena
 *
 */
public class PayInforDaoImpl extends BaseDao implements IPayInforDao {

	@Override
	public void add(PayInfor bean) {
		super.setConnection();

		try {
			ps = conn.prepareStatement("INSERT INTO PaymentInfo([serialNumber],[paymentStatus],[paymentSemester],[paymentDate],[totalPayable],[totalPaid],[payers],[department],[direction],[tuition],[lodging],[bookFees],[IDCard]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, bean.getSerialNumber());
			ps.setString(2, bean.getPaymentStatus());
			ps.setString(3, bean.getPaymentSemester());
			ps.setDate(4, (Date) bean.getPaymentDate());
			ps.setDouble(5, bean.getTotalPayable());
			ps.setDouble(6, bean.getTotalPaid());
			ps.setString(7, bean.getPayers());
			ps.setString(8, bean.getDepartment());
			ps.setString(9, bean.getDirection());
			ps.setDouble(10, bean.getTuition());
			ps.setDouble(11, bean.getLodging());
			ps.setDouble(12, bean.getBookFees());
			ps.setString(13, bean.getID_Card());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeConnection();
		}

	}

	@Override
	public List<PayInfor> findByIdCard(String IDCard) {
		List<PayInfor> list = new ArrayList<PayInfor>();

		super.setConnection();

		try {
			ps = conn.prepareStatement("select * from PaymentInfo where IDCard = ?");
			ps.setString(1, IDCard);

			rs = ps.executeQuery();

			while (rs.next()) {
				PayInfor bean = new PayInfor();
				// ID	serialNumber	paymentStatus	paymentSemester	paymentDate	totalPayable	
				// totalPaid	payers	department	direction	tuition	lodging	bookFees	IDCard
				bean.setID(rs.getInt("ID"));
				bean.setSerialNumber(rs.getString("serialNumber"));
				bean.setPaymentStatus(rs.getString("paymentStatus"));
				bean.setPaymentSemester(rs.getString("paymentSemester"));
				bean.setPaymentDate(rs.getDate("paymentDate"));
				bean.setTotalPayable(rs.getDouble("totalPayable"));
				bean.setTotalPaid(rs.getDouble("totalPaid"));
				bean.setPayers(rs.getString("payers"));
				bean.setDepartment(rs.getString("department"));
				bean.setDirection(rs.getString("direction"));
				bean.setTuition(rs.getDouble("tuition"));
				bean.setLodging(rs.getDouble("lodging"));
				bean.setBookFees(rs.getDouble("bookFees"));
				bean.setID_Card(rs.getString("IDCard"));
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
