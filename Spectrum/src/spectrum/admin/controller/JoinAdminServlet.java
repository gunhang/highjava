package spectrum.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.admin.service.AdminLoginService;
import spectrum.admin.vo.AdminVO;
import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/adminlogin/adminjoin.do")
public class JoinAdminServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/adminlogin/adminjoin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String adminId= req.getParameter("adminId");
		String adminPassword=req.getParameter("adminPassword");
		HttpSession session = req.getSession();

		AdminVO av = new AdminVO();
		
		av.setAdminId(adminId);
		av.setAdminPassword(adminPassword);
		
		
		
		String var=AdminLoginService.getInstance().joinAdmin(av);
		 
		if(var != null) {
			session.setAttribute("adminId", adminId);			
			session.setAttribute("adminPassword", adminPassword);
			session.setMaxInactiveInterval(60*60*6);
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("adminjoin.do").forward(req, resp);
		}
		
		
		
		

		
		
	}
	

}
