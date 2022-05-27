package spectrum.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.board.service.INoticBoardService;
import spectrum.board.service.IQuestionBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.service.QuestionBoardServiceImpl;

@WebServlet("/board/questiondelete.do")
public class DeleteQuestionBoardServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String questionboardNumber = req.getParameter("questionboardNumber");
		
		// 2. 서비스 객체 가져오기
		IQuestionBoardService boardService = QuestionBoardServiceImpl.getInstance();
		
		// 3. 회원정보 조회
		int cnt = boardService.delteQuestionBoard(questionboardNumber);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		String redirecturl =req.getContextPath() + "/board/questionlist.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
