package web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/signout")
public class SignOutSerlvet extends HttpServlet {

	private static final long serialVersionUID = -6240128204587834329L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 移除登陆
		if (req.getSession().getAttribute("user") != null) {
			req.getSession().removeAttribute("user");
		} else if (req.getSession().getAttribute("userbean") != null) {
			req.getSession().removeAttribute("userbean");
		}

		// 返回登录页
		resp.sendRedirect(req.getContextPath() + "/login");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
