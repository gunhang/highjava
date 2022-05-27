package spctrum.report.controller;

import java.io.IOException;
import java.net.URLEncoder;
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
import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;



@WebServlet("/report/boardReportDelete.do")
public class DeleteBoardReportServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터정보 가져오기
		String boardreportNumber = req.getParameter("boardreportNumber");
		
		
		//2.서비스 객체 가져오기
		IReportService reportService = ReportServiceImpl.getInstance();
		
		
		//3.회원정보 조회
		int cnt = reportService.deleteBoardReport(boardreportNumber);
			
		String msg = "";
		if(cnt>0) {
			msg="성공";
		}else {
			msg="실패";
		}
	
		String redirecturl =req.getContextPath() + "/report/reportlist.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		//4. 목록 조회화면으로 이동
         // req.getRequestDispatcher("/member/list.do").forward(req, resp);
             
		//요청한 것이 잘못됐을 때 올바른 주소를 알려줌 2번 적용
		/*String redirectUrl =
		req.getContextPath()+"/reportlist.do?msg="
		                    +URLEncoder.encode(msg,"UTF-8");
		*/
	/*	resp.sendRedirect(redirectUrl); //목록조회 화면으로 리다이렉트
*/	
		
	
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
