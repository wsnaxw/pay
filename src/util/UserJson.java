package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PayInfor;
import net.sf.json.JSONObject;
import service.IStudentService;
import service.impl.StudentServiceImpl;

/**
 * 转换数据为Json
 * @author jalena
 *
 */
public class UserJson extends HttpServlet {

	private static final long serialVersionUID = 128500229609623582L;

	IStudentService service = new StudentServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 判断用户是否登陆
		if (req.getSession().getAttribute("user") == null) {
			resp.sendRedirect(req.getContextPath() + "/servlet/login");
			return;
		}

		String IdCard = req.getParameter("Idcard");

//		System.out.println(IdCard);

		List<PayInfor> list = new ArrayList<PayInfor>();

		list = service.LoginUser(IdCard).getPayList();

		//		for (PayInfor pay : list) {
		//			System.out.println(pay.getID_Card());
		//		}

		try {
			JSONObject json = new JSONObject();

			String jsonstr = "";
			int count = 0;

			for (PayInfor pay : list) {
				json.put("ID", pay.getID()); //ID
				json.put("ID_Card", pay.getID_Card()); // 身份证
				json.put("serialNumber", pay.getSerialNumber()); // 流水号
				json.put("PaymentStatus", pay.getPaymentStatus());// 缴费状态
				json.put("paymentSemester", pay.getPaymentSemester());//学期
				json.put("paymentDate", pay.getPaymentDate().toString());// 缴费日期
				json.put("totalPayable", pay.getTotalPayable());// 应交总额
				json.put("totalPaid", pay.getTotalPaid());// 实交总额
				json.put("Payers", pay.getPayers());// 缴费人
				json.put("department", pay.getDepartment());// 院系
				json.put("direction", pay.getTuition());// 方向
				json.put("lodging", pay.getLodging());// 住宿费
				json.put("bookFees", pay.getBookFees());// 书本费

				if (count < list.size()-1) {
//					System.out.println(count);
					jsonstr += json.toString() + ",";
					count++;
				}else {
					jsonstr += json.toString();
				}

			}

			//			System.out.println(json.toString());

//			System.out.println("[" + jsonstr + "]");
			resp.getOutputStream().write(("[" + jsonstr + "]").getBytes("utf-8"));
			resp.setContentType("text/json; charset=UTF-8");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
