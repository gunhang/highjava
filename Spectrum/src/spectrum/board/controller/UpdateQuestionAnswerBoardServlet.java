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
import spectrum.board.service.IQuestionAnswerBoardService;
import spectrum.board.service.IQuestionBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.service.QuestionAnswerBoardServiceImpl;
import spectrum.board.service.QuestionBoardServiceImpl;
import spectrum.board.vo.NoticeBoardVO;
import spectrum.board.vo.QuestionAnswerBoardVO;
import spectrum.board.vo.QuestionBoardVO;

@WebServlet("/board/questionAnswerupdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)
public class UpdateQuestionAnswerBoardServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
				String questionboardNumber = req.getParameter("questionboardNumber");
						
				// 2. 서비스 객체 가져오기
				IQuestionAnswerBoardService boardService = QuestionAnswerBoardServiceImpl.getInstance();
						
						
						
				// 3. 회원정보 조회
				QuestionAnswerBoardVO qabv = boardService.getQuestionAnswerBoard(questionboardNumber);
				
			
				
				req.setAttribute("qabv", qabv);
				
				
				// 4. 업데이트 화면으로 포워딩
				req.getRequestDispatcher("/WEB-INF/views/board/questionAnswerupdateForm.jsp")
					.forward(req, resp);
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
			String questionboardNum = req.getParameter("questionboardNum");
			String qstn_ansbrdCn = req.getParameter("qstn_ansbrdCn");
				
				
		// 2. 서비스 객체 생성하기
			IQuestionAnswerBoardService boardService = QuestionAnswerBoardServiceImpl.getInstance();
				
				
		// 3. 회원정보 수정
				
			QuestionAnswerBoardVO qabv = new QuestionAnswerBoardVO();
			qabv.setQstn_ansbrdCn(qstn_ansbrdCn);
			qabv.setQuestionboardNum(questionboardNum);
				
			int cnt = boardService.updateQuestionAnswerBoard(qabv);
				
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
		String redirecturl =req.getContextPath() + "/board/questiondetail.do?msg=" + URLEncoder.encode(msg, "UTF-8")+"&&questionboardNumber=" +questionboardNum;
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
