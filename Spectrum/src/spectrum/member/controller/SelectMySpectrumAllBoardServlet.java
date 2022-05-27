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
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.mySpectrumListVO;


@WebServlet("/mySpectrumList.do")

public class SelectMySpectrumAllBoardServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 //1. 서비스 객체 생성하기
		  MemberService memberService = MemberServiceImpl.getInstance();
		  HttpSession session = req.getSession();
		  String memId =(String)session.getAttribute("memberId");
		  String url = "/WEB-INF/views/member/mySpectrumList.jsp";
		  MemberVO mv = memberService.getMember(memId);
		  //2. 회원정보조회
		  	if(req.getParameter("friendId")!=null) {
		  		memId= req.getParameter("friendId");
		  		url="/WEB-INF/views/member/mySpectrumList2.jsp";
		  		
		  	}
		  	
		 
		  	
		  	
		  
		  List<mySpectrumListVO> memList = memberService.getAllBoardList(memId);
		  req.setAttribute("memList", memList);
		  
		  RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		  dispatcher.forward(req, resp);  //뷰페이지로 전달
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}


