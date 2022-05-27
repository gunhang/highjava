package spectrum.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;

@WebServlet("/member/NickNameCheckService.do")
public class CheckNickNameServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberNickName= req.getParameter("userNickName");
		
		MemberService memberService =MemberServiceImpl.getInstance();
		
		String result = memberService.checkNickName(memberNickName);
		
		if(result != null) {
			req.setAttribute("uId", result);
		} else {
			req.setAttribute("uId", null);
		}
		req.getRequestDispatcher("/idCheck.jsp").forward(req, resp);
		
	
	
	
	}

}
