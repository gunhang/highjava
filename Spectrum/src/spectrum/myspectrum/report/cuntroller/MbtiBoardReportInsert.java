package spectrum.myspectrum.report.cuntroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.blacklist.service.BlacklistServiceImpl;
import spectrum.blacklist.service.IBlacklistService;
import spectrum.blacklist.vo.BlacklistVO;
import spectrum.mbtiboard.dao.MbtiBoardDao;
import spectrum.mbtiboard.report.dao.MbtiBoardReportDao;
import spectrum.mbtiboard.report.service.MbtiBoardReportService;
import spectrum.mbtiboard.report.vo.MbtiBoardReportVO;
import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.member.service.MemberService;
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.report.service.MemberReportService;
import spectrum.myspectrum.report.vo.MemberReportVO;
@WebServlet("/memberreport/myreportinsert")
public class MbtiBoardReportInsert extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String reportedId =req.getParameter("reportedId");
		String reportId=req.getParameter("reportId");
		String textarea = req.getParameter("textarea");
		String postNum = req.getParameter("postNum");
		
		req.setAttribute("postNum", postNum);
		if(textarea==null) { // 널값 삽입 방지
			textarea="";
		}
		//(신고 데이터 삽입)
		MemberReportVO reportVO = new MemberReportVO();
		reportVO.setMemberReportedId(reportedId);
		reportVO.setMemberReportId(reportId);
		reportVO.setMemberReportReason(textarea);
		MemberReportService.getInstance().reportInsert(reportVO);
		//(신고 횟수 넣기)
		String reportNum=MemberReportService.getInstance().count(reportedId);
		MemberVO mv = new MemberVO(); 
		mv.setMemberId(reportedId);
		mv.setMemberReportcount(reportNum);
		MemberReportService.getInstance().ReportNum(mv);
		
		
		//(신고 5번 자동화 시스템) - 머지할때 읽어보세요!
		IBlacklistService blackService = BlacklistServiceImpl.getInstance();
		List<BlacklistVO> blackList = blackService.getALLBlackList();
		blackList = blackService.getALLBlackList();
		List<BlacklistVO> memberlistAll = blackService.getMemberlistAll();
		int memberSize = memberlistAll.size();
		if (memberSize > 0) {
			for (int j = 0; j < memberSize; j++) {
				String memberId = (memberlistAll.get(j).getMemberId());
				String reportcount = String.valueOf(blackService.getReportcount(memberId));
				int c = Integer.parseInt(reportcount);
				System.out.println(c % 5);
				if (c!=0 && c % 5 == 0) {
					String check= blackService.gettoBlacklistCheck(memberId);
					System.out.println(check);
					if(check == null) {
						check = "없음";
					}
					if (check.equals("N") || check.equals("없음")){
						
						blackService.insertBlacklistAuto(memberId);
						blackList = blackService.getALLBlackList();
						
					}
				}
				
				if(c!=0 && c % 5  == 1) {
					
				blackService.insertBlacklistAutoBanDuplication(memberId);
				blackList = blackService.getALLBlackList();
				}
				
			}
		}
		
		req.setAttribute("memberlistAll", memberlistAll);	
		req.setAttribute("blackList",blackList);
	
		// 디테일 출력용 
	/*	mv = null;
		mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiBoardNum);
		req.setAttribute("mv", mv);*/
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/mySpectrumDetail.do");
		dispatcher.forward(req, resp);
	}
}
