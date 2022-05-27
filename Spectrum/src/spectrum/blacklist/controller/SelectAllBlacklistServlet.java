package spectrum.blacklist.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import spectrum.member.controller.InsertMemberServlet;
import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/blacklist/blacklistlist.do")
public class SelectAllBlacklistServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 서비스 객체 생성하기
		IBlacklistService blackService = BlacklistServiceImpl.getInstance();

		// 2. 회원정보 조회
		List<BlacklistVO> blackList = blackService.getALLBlackList();
		blackList = blackService.getALLBlackList();

		LocalDate date = LocalDate.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String today = date.format(dateTimeFormatter);

		int blackSize = blackList.size();
		if (blackSize > 0) {
			for (int i = 0; i < blackSize; i++) {

				if (blackList.get(i).getBlacklistReleasedate().substring(0, 10).equals(today)) {

					blackService.deleteBlacklist(blackList.get(i).getBlacklistNumber());
					blackList = blackService.getALLBlackList();
				}
			}
		}
		
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

	RequestDispatcher dispatcher = req
			.getRequestDispatcher("/WEB-INF/views/blacklist/blacklistlist.jsp");dispatcher.forward(req,resp); // 뷰페이지로
																												// 전달

	}

	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
