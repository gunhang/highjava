package spectrum.mbtiboard.report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.dao.MbtiBoardDao;
import spectrum.mbtiboard.report.dao.MbtiBoardReportDao;
import spectrum.mbtiboard.report.service.MbtiBoardReportService;
import spectrum.mbtiboard.report.vo.MbtiBoardReportVO;
import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
@WebServlet("/mbtiboard/reportinsert")
public class MbtiBoardReportInsert extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mbti =req.getParameter("mbti");
		String memberId=req.getParameter("memberId");
		String mbtiBoardNum = req.getParameter("mbtiBoardNum");
		String textarea = req.getParameter("textarea");
		if(textarea==null) { // 널값 삽입 방지
			textarea="";
		}
		//(신고 데이터 삽입)
		MbtiBoardReportVO reportVO = new MbtiBoardReportVO();
		reportVO.setBoardClassificationCode(mbti);
		reportVO.setMemberId(memberId);
		reportVO.setMbtiboardPostnum(mbtiBoardNum);
		reportVO.setBoardreportReason(textarea);
		MbtiBoardReportService.getInstance().reportInsert(reportVO);
		//(신고 횟수 넣기)
		String reportNum=MbtiBoardReportDao.getInstance().count(mbtiBoardNum);
		MbtiBoardVO mv = new MbtiBoardVO(); 
		mv.setmbtiboardNumberreported(reportNum);
		mv.setmbtiboardPostnum(mbtiBoardNum);
		MbtiBoardReportDao.getInstance().boardReportNum(mv);
		
		
		// 디테일 출력용 
		mv = null;
		mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiBoardNum);
		req.setAttribute("mv", mv);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboarddetail.jsp");
		dispatcher.forward(req, resp);
	}
}
