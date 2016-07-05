package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Student;
import net.sf.json.JSONObject;
import service.IStudentService;
import service.impl.StudentServiceImpl;

@WebServlet(urlPatterns="/adminjson")
public class AdminJson extends HttpServlet{

	private static final long serialVersionUID = 5515189860781349858L;

	IStudentService service = new StudentServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 判断是否登录，如果session为空跳转至登录页！
		if (req.getSession().getAttribute("userbean") == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
//		System.out.println(req.getRequestURI());
		
		List<Student> list = new ArrayList<Student>();
		list = service.findALl();
		
		try {
			
			JSONObject jsonObject = new JSONObject();
			String str = "";
			int count = 0;
			
			for (Student stu : list) {
				jsonObject.put("ID", stu.getID());
				jsonObject.put("stuNum", stu.getStuNum());
				jsonObject.put("IDCard", stu.getIDCard());
				jsonObject.put("name", stu.getName());
				jsonObject.put("department", stu.getDepartment());
				jsonObject.put("grade", stu.getGrade());
				jsonObject.put("sClass", stu.getsClass());
				jsonObject.put("direction", stu.getDirection());
				jsonObject.put("educationalSystem", stu.getEducationalSystem());
				
				if (count < list.size() -1) {
					str += jsonObject.toString() + ",";
					count++;
				}else {
					str += jsonObject.toString();
				}
			}
			
			resp.getOutputStream().write(("[" + str + "]").getBytes("utf-8"));
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
