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
import spectrum.board.service.IQuestionAnswerBoardService;
import spectrum.board.service.IQuestionBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.service.QuestionAnswerBoardServiceImpl;
import spectrum.board.service.QuestionBoardServiceImpl;
import spectrum.board.vo.NoticeBoardVO;
import spectrum.board.vo.QuestionAnswerBoardVO;
import spectrum.board.vo.QuestionBoardVO;

@WebServlet("/board/questionAnswerinsert.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)

public class InsertQuestionAnswerBoardServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/board/insertquestionAnswerForm.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
		String questionboardNumber = req.getParameter("questionboardNum");
		String adminId = req.getParameter("adminId");
		String qstn_ansbrdCn = req.getParameter("qstn_ansbrdCn");
		
				
				
				
		// 2. 서비스 객체 생성하기
		IQuestionAnswerBoardService questionboardService = QuestionAnswerBoardServiceImpl.getInstance();
				
				
		// 3. 회원정보 등록
		QuestionAnswerBoardVO qabv = new QuestionAnswerBoardVO();
		qabv.setQuestionboardNum(questionboardNumber);
		qabv.setQuestionAnswerboardNum(questionboardNumber);
		qabv.setAdminId(adminId);
		qabv.setQstn_ansbrdCn(qstn_ansbrdCn);
		
		
		int cnt = questionboardService.insertQuestionAnswerBoard(qabv);
		
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
		String redirecturl =req.getContextPath() + "/board/questionlist.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
