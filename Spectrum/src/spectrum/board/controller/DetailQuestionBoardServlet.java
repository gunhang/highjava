package spectrum.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.board.service.INoticBoardService;
import spectrum.board.service.IQuestionAnswerBoardService;
import spectrum.board.service.IQuestionBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.service.QuestionAnswerBoardServiceImpl;
import spectrum.board.service.QuestionBoardServiceImpl;
import spectrum.board.vo.NoticeBoardVO;
import spectrum.board.vo.QuestionAnswerBoardVO;
import spectrum.board.vo.QuestionBoardVO;

@WebServlet("/board/questiondetail.do")
public class DetailQuestionBoardServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String questionboardNumber = req.getParameter("questionboardNumber");
		String questionboardansweryn = req.getParameter("questionboardAnsweryn");
		String questionboardNum = questionboardNumber;
		// 2. 서비스 객체 가져오기
		IQuestionBoardService boardService = QuestionBoardServiceImpl.getInstance();
		IQuestionAnswerBoardService answerboardService = QuestionAnswerBoardServiceImpl.getInstance();
		// 2-1. 서비스 객체 가져오기
		// 3. 회원정보 조회
		QuestionBoardVO qbv = boardService.getQuestionBoard(questionboardNumber);
		// 3-1. 회원정보 조회
		
		if(questionboardansweryn ==null) {
			questionboardansweryn = "Y";
		}
		if(questionboardansweryn.equals("Y")) {
			
			QuestionAnswerBoardVO qabv = answerboardService.getQuestionAnswerBoard(questionboardNum);
			 qbv.setQuestionboardAnsweryn(questionboardansweryn);
			 req.setAttribute("qabv", qabv);
			
		}
		
		req.setAttribute("qbv", qbv);
		
		
		// 결과를 VIEW화면에 출력하기
		// 커밋용 주석!
		req.getRequestDispatcher("/WEB-INF/views/board/questiondetail.jsp")
				.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
