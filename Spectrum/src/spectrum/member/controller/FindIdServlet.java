package spectrum.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/member/findmember.do")
public class FindIdServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/findMember.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberName = req.getParameter("memberName");
		String memberRegno = req.getParameter("memberRegno");
		
		MemberVO mv= new MemberVO();
		
		mv.setMemberName(memberName);
		mv.setMemberRegno(memberRegno);
		
		MemberService memberService = MemberServiceImpl.getInstance();
		
		String result= memberService.findIdMember(mv);
		
		mv.setMemberId(result);
		req.setAttribute("mv", mv);
		req.getRequestDispatcher("/WEB-INF/views/member/joinMember.jsp").forward(req, resp);
		
		
		
	}
}
