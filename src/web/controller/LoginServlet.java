package web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Student;
import service.IStudentService;
import service.impl.StudentServiceImpl;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 940710676364386627L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置编码
		req.setCharacterEncoding("utf-8");
		
		// 设置网页格式及编码
		resp.setContentType("text/html;charset=utf-8");

		// 获取用户输入的身份证号
		String IdCard = req.getParameter("IDCard");

		IStudentService service = new StudentServiceImpl();
		Student user = service.LoginUser(IdCard);

		// 判断用户是否存在
		if (user == null) {
			String message = String.format("对不起，用户名或密码有误！！请重新登录！2秒后为您自动跳到登录页面！！<meta http-equiv='refresh' content='2;url=%s'",
			        req.getContextPath() + "/servlet/login");
			req.setAttribute("message", message);
			req.getRequestDispatcher("/message.jsp").forward(req, resp);
			return;
		}

		//登录成功后，就将用户存储到session中
		req.getSession().setAttribute("user", user);
//		String message = String.format("恭喜：%s,登陆成功！本页将在1秒后跳到首页！！<meta http-equiv='refresh' content='1; url=%s'", user.getName(),req.getContextPath() + "/index.jsp");
//		req.setAttribute("message", message);
//		req.getRequestDispatcher("/message.jsp").forward(req, resp);
		resp.sendRedirect(req.getContextPath() + "/servlet/User");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
