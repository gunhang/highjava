package spectrum.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.board.service.INoticBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.vo.NoticeBoardVO;

@WebServlet("/board/noticeinsert.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)

public class InsertBoardServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/board/noticeinsertForm.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
		String noticeboardNum = req.getParameter("noticeboardNum");
		String adminId = req.getParameter("adminId");
		String noticeboardTitle = req.getParameter("noticeboardTitle");
		String noticeboardDate = req.getParameter("noticeboardDate");
		String noticeboardType = req.getParameter("noticeboardType");
		String noticeboardContent = req.getParameter("noticeboardContent");
		
		
		// 2. 서비스 객체 생성하기
		INoticBoardService boardService = NoticeBoardSeriveImpl.getInstance();
	
		// 3. 회원정보 등록
		NoticeBoardVO bv = new NoticeBoardVO();
		bv.setNoticeboardNum(noticeboardNum);
		bv.setAdminId(adminId);
		bv.setNoticeboardTitle(noticeboardTitle);
		bv.setNoticeboardDate(noticeboardDate);
		bv.setNoticeboardType(noticeboardType);
		bv.setNoticeboardContent(noticeboardContent);
		
		int cnt = boardService.insertBoard(bv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		
		// 4. 목록 조회화면으로 이동
		/*req.getRequestDispatcher("/member/list.do")
			.forward(req, resp);*/
		String redirecturl =req.getContextPath() + "/board/noticelist.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
