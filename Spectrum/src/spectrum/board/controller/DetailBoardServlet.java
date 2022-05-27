package spectrum.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.board.service.INoticBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.vo.NoticeBoardVO;

@WebServlet("/board/detail.do")
public class DetailBoardServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String noticeboardNum = req.getParameter("NoticeboardNum");
		
		
		// 2. 서비스 객체 가져오기
		INoticBoardService boardService = NoticeBoardSeriveImpl.getInstance();
		
		
		
		// 3. 회원정보 조회
		NoticeBoardVO bv = boardService.getBoard(noticeboardNum);
							
		
		
		req.setAttribute("bv", bv);
		
		// 결과를 VIEW화면에 출력하기
		req.getRequestDispatcher("/WEB-INF/views/board/detail.jsp")
				.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
