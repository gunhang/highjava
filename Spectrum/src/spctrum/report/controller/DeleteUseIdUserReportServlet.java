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



@WebServlet("/report/userReportDeleteUseId.do")
public class DeleteUseIdUserReportServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		

		
		req.getRequestDispatcher("/WEB-INF/views/report/reportuserdeleteuseid.jsp")
		.forward(req, resp);
	
	
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberReportedId = req.getParameter("memberReportedId");
		
		IReportService reportService = ReportServiceImpl.getInstance();
		int cnt = reportService.deleteUserUseIdReport(memberReportedId);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		
		String redirecturl =req.getContextPath() + "/report/reportlist.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
		
	}
}
