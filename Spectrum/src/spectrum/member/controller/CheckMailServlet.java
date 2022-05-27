package spectrum.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;

@WebServlet("/member/mailCheckService.do")
public class CheckMailServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
		
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String userMail = req.getParameter("userMail");

		
		MemberService memberService = MemberServiceImpl.getInstance();
		
		String result = memberService.checkMail(userMail);
		System.out.println(result);
		
		if(result != null) {
			req.setAttribute("uId", result);
		} else {
			req.setAttribute("uId", null);
		}
		req.getRequestDispatcher("/idCheck.jsp").forward(req, resp);
		
	}

}

