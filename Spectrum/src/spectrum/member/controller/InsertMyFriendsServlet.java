package spectrum.member.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.ISpectrumAtchFileService;
import kr.or.ddit.comm.service.SpectrumAtchFileServiceImpl;
import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.FriendVO;
import spectrum.myspectrum.vo.SpectrumAttachFileVO;
import spectrum.myspectrum.vo.SpectrumBoardVO;

@WebServlet("/myFriendsInsert.do")
public class InsertMyFriendsServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/friendinsert.jsp").forward(req, resp);
		
	              

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.요청 파라미터 정보 가져오기
        String friendAppliedId = req.getParameter("friendAppliedId");
        String friendRequestedId = req.getParameter("friendRequestedId");
    
	
	//2.서비스 객체 생성하기
       MemberService memberService = MemberServiceImpl.getInstance();
	
	
	//3.게시물 정보 등록
   FriendVO fv = new FriendVO();
   fv.setFriendAppliedId(friendAppliedId);
   fv.setFriendRequestedId(friendRequestedId);

	
	int cnt = memberService.insertFriends(fv);
	
	String msg = "";
	if(cnt>0) {
		msg="성공";
	}else {
		msg="실패";
	}
	
	req.setAttribute("msg", msg);
      
	RequestDispatcher dispatcher = 
			req.getRequestDispatcher("/WEB-INF/friendinsert.jsp");
		dispatcher.forward(req, resp);
	}
}