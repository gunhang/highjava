package spectrum.myatc.controller;

import java.awt.Window;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import spectrum.myatc.service.IMyAtcService;
import spectrum.myatc.service.MyAtcServiceImpl;
import spectrum.myatc.vo.MyAtcVO;

@WebServlet("/myatcinsert.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)

public class MyAtcProfileInsertServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/myatcinsert.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		 1. 요청 파라미터 정보 가져오기
//		String memId = req.getParameter("memId");
//		String memName = req.getParameter("memName");
//		String memTel = req.getParameter("memTel");
//		String memAddr = req.getParameter("memAddr");
//		
//		 2. 서비스 객체 생성하기
//		IMemberService memberService = MemberServiceImpl.getInstance();
		
		IMyAtcService fileService =MyAtcServiceImpl.getInstance();
		
		MyAtcVO MyAtcVO = new MyAtcVO();
		/* HttpSession session = req.getSession();
		 String memberId = (String) session.getAttribute("memberId");
		 MyAtcVO.setMemberId(memberId);
		 */
		try {
			// 첨부파일 목록 저장(공통기능)
			MyAtcVO = fileService.saveAtchFileList(req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 3. 회원정보 등록
		/*MyAtcVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemName(memName);
		mv.setMemTel(memTel);
		mv.setMemAddr(memAddr);*/
//		MyAtcVO.setMyflofileatcId(myflofileatcId);(atchFileVO.getAtchFileId());
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		/*
		MyAtcVO.setMemberId(memberId);*/
//		int cnt = memberService.insertMember(mv);
/*		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		*/
		// 4. 목록 조회화면으로 이동
		/*req.getRequestDispatcher("/member/list.do")
			.forward(req, resp);*/
		
		String redirecturl =req.getContextPath() + "/mySpectrumList.do?"+memberId;
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
