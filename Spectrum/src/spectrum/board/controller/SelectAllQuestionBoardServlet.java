package spectrum.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.board.service.INoticBoardService;
import spectrum.board.service.IQuestionBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.service.QuestionBoardServiceImpl;
import spectrum.board.vo.NoticeBoardVO;
import spectrum.board.vo.QuestionBoardVO;

@WebServlet("/board/questionlist.do")
public class SelectAllQuestionBoardServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			// 1. 서비스 객체 생성하기
			IQuestionBoardService questionboardService = QuestionBoardServiceImpl.getInstance();
			
			// 2. 회원정보 조회
			List<QuestionBoardVO> questionboardList = questionboardService.getALLQuestionBoardList();
			
			req.setAttribute("questionboardList", questionboardList);
			
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/WEB-INF/views/board/questionlist.jsp");
			dispatcher.forward(req, resp); // 뷰페이지로 전달
			
			
			//커밋용 주석
			
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
