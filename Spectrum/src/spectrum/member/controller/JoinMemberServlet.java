package spectrum.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/member/memberjoin.do")
public class JoinMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/joinMember.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인처리
		
		//joinMember.jsp에서 지정한 (name="memberId") 값으로 input값을 불러옴.
		String memberId= req.getParameter("memberId");
		String tempPassword=req.getParameter("memberPassword");
		System.out.println(tempPassword);
		
		String memberPassword=SHA256.encodeSha256(tempPassword);
		
		System.out.println(memberPassword);

		HttpSession session = req.getSession();
		
		MemberService memberService = MemberServiceImpl.getInstance();
		MemberVO mv=new MemberVO();
		
		mv.setMemberId(memberId);
		mv.setMemberPassword(memberPassword);
		
		String isExists = memberService.joinMember(mv);

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = resp.getWriter(); 
		
		 
		if(isExists!=null) {
			mv=memberService.getMember(memberId);
			session.setAttribute("memberId", memberId);			
			session.setAttribute("memberPassword", memberPassword);
			session.setAttribute("mbtiCode", mv.getMbticode());
			session.setAttribute("memberNickname", mv.getMemberNickname());
			session.setAttribute("mv", mv);
			session.setMaxInactiveInterval(60*60*6);
			
			
	         writer.println("<script>alert('"+mv.getMemberName()+"님 환영합니다.'); location.href='"+"/Spectrum/main.jsp"+"';</script>"); 
	         writer.close();
			
			
		}else {
	         
	         
	         writer.println("<script>alert('가입된 회원아이디가 아니거나 비밀번호가 다릅니다.'); location.href='"+"/Spectrum/member/memberjoin.do"+"';</script>"); 
	         writer.close();

			
			

		}

	}
	

}
