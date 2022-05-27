package spectrum.board.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import spectrum.board.service.INoticBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.vo.NoticeBoardVO;

@WebServlet("/board/update.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)
public class UpdateNoticeBoardServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String noticeboardNum = req.getParameter("noticeboardNum");
				
		// 2. 서비스 객체 가져오기
		INoticBoardService boardService = NoticeBoardSeriveImpl.getInstance();
				
				
				
		// 3. 회원정보 조회
		NoticeBoardVO bv = boardService.getBoard(noticeboardNum);
		
	
		
		req.setAttribute("bv", bv);
		
		
		// 4. 업데이트 화면으로 포워딩
		req.getRequestDispatcher("/WEB-INF/views/board/updateForm.jsp")
			.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
		String noticeboardNum = req.getParameter("noticeboardNum");
		String noticeboardTitle = req.getParameter("noticeboardTitle");
		String noticeboardDate = req.getParameter("noticeboardDate");
		String adminId = req.getParameter("admin_id");
		String noticeboardType = req.getParameter("noticeboardType");
		String noticeboardContent = req.getParameter("noticeboardContent");
		
		// 2. 서비스 객체 생성하기
		INoticBoardService boardService = NoticeBoardSeriveImpl.getInstance();
		
		
		// 3. 회원정보 수정
		
		NoticeBoardVO bv = new NoticeBoardVO();
		bv.setNoticeboardNum(noticeboardNum);
		bv.setNoticeboardTitle(noticeboardTitle);
		bv.setNoticeboardDate(noticeboardDate);
		bv.setNoticeboardType(noticeboardType);
		bv.setNoticeboardContent(noticeboardContent);
		
		
		int cnt = boardService.updateBoard(bv);
		
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
		String redirecturl =req.getContextPath() + "/board/detail.do?msg=" + URLEncoder.encode(msg, "UTF-8")+"&&NoticeboardNum=" +noticeboardNum;
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
