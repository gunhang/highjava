package spctrum.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spctrum.report.service.IReportService;
import spctrum.report.service.ReportServiceImpl;
import spctrum.report.vo.ReportVO;
import spectrum.board.service.INoticBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.vo.NoticeBoardVO;

@WebServlet("/report/reportlist.do")
public class SelectAllReportServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			// 1. 서비스 객체 생성하기
			IReportService reportService = ReportServiceImpl.getInstance();
			
			// 2. 회원정보 조회
			List<ReportVO> reportUserList = reportService.getALLUserReportList();
			List<ReportVO> reportBoardList = reportService.getALLBoardReportList();
			
			req.setAttribute("reportUserList", reportUserList);
			req.setAttribute("reportBoardList", reportBoardList);
			
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/WEB-INF/views/report/reportlist.jsp");
			dispatcher.forward(req, resp); // 뷰페이지로 전달
			
			
			
			
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
