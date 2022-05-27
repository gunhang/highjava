package spectrum.admin.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.admin.service.AdminLoginService;
import spectrum.admin.vo.AdminVO;

@WebServlet("/adminlogin/admininsert.do")
public class InsertAdminServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/adminlogin/admininsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String adminId = req.getParameter("adminId");
		String adminPassword = req.getParameter("password");
		String adminRegno = req.getParameter("adminRegno");
		String adminPhonenum = req.getParameter("phoneNum");
		String adminZipcode = req.getParameter("adminZipcode");
		String adminMail = req.getParameter("adminMail");
		String adminNickname = req.getParameter("adminNickname");
		String adminAddr1 = req.getParameter("adminAddr1");
		String adminAddr2 = req.getParameter("adminAddr2");
		
		
		
		AdminVO av = new AdminVO();
		av.setAdminId(adminId);
		av.setAdminPassword(adminPassword);
		av.setAdminRegno(adminRegno);
		av.setAdminPhonenum(adminPhonenum);
		av.setAdminZipcode(adminZipcode);
		av.setAdminMail(adminMail);
		av.setAdminNickname(adminNickname);
		av.setAdminAddr1(adminAddr1);
		av.setAdminAddr2(adminAddr2);
	
		AdminLoginService.getInstance().adminInsert(av);
		

		//4. 목록 조회화면으로 이동
		req.getRequestDispatcher("/main.jsp").forward(req, resp);
		
		//목록조회 화면으로 리다이렉트
	}
}
