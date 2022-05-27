package spectrum.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.myspectrum.vo.FriendVO;
import spectrum.myspectrum.vo.mySpectrumListVO;


@WebServlet("/myFriendsList.do")
public class MyFriendsListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 //1. 서비스 객체 생성하기
		  MemberService memberService = MemberServiceImpl.getInstance();
		  HttpSession session = req.getSession();
		  String memId =(String)session.getAttribute("memberId");
		  
		  
		  
		  List<FriendVO> memListN = memberService.getAllFriendListN(memId);
		  List<FriendVO> memListY = memberService.getAllFriendListY(memId);
		  
		  req.setAttribute("memListN", memListN);
		  req.setAttribute("memListY", memListY);
		  
		  
		  RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/myFriendsList.jsp");
		  dispatcher.forward(req, resp);  //뷰페이지로 전달
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
