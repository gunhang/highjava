package spectrum.member.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.myspectrum.vo.FriendVO;



@WebServlet("/myFriendsDelete.do")
public class DeleteMyFriendsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터정보 가져오기
		
		  HttpSession session = req.getSession();
		  String requestId = req.getParameter("memId") ;
		  String memId =(String)session.getAttribute("memberId");
		  FriendVO fv = new FriendVO();
		  fv.setFriendRequestedId(requestId);
		  fv.setFriendAppliedId(memId);
		//2.서비스 객체 가져오기
		MemberService memberService = MemberServiceImpl.getInstance();
		
		//3.회원정보 조회
		int cnt = memberService.deleteFriends(fv);
	
		String msg = "";
		if(cnt>0) {
			msg="성공";
		}else {
			msg="실패";
		}
	
		//4. 목록 조회화면으로 이동
          req.getRequestDispatcher("/WEB-INF/views/member/myFriendsDelete.jsp").forward(req, resp);
             
	/*	//요청한 것이 잘못됐을 때 올바른 주소를 알려줌 2번 적용
		String redirectUrl =
		req.getContextPath()+"/myFriendsList.do?msg="
		                    +URLEncoder.encode(msg,"UTF-8");
		
		resp.sendRedirect(redirectUrl); //목록조회 화면으로 리다이렉트
	*/
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
