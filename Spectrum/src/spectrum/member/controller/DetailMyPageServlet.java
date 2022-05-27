package spectrum.member.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;
import spectrum.rank.service.IRankService;
import spectrum.rank.service.RankServiceImpl;
import spectrum.rank.vo.RankVO;



@WebServlet("/myPageDetail.do")
public class DetailMyPageServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터정보 가져오기
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		//2.서비스 객체 가져오기
		MemberService memberService = MemberServiceImpl.getInstance();
		/*IAtchFileService fileService = AtchFileServiceImpl.getInstance();*/
		
		//(날짜 지난후 하트부여) - 머지할때 보세요!
		
		IRankService rankService = RankServiceImpl.getInstance();
		List<RankVO> rankList = rankService.getALLMemberWhiteList();
		rankList = rankService.getALLMemberWhiteList();
		
		LocalDate date = LocalDate.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String today = date.format(dateTimeFormatter);

		int rankSize = rankList.size();
		if (rankSize > 0) {
			for (int i = 0; i < rankSize; i++) {

				// System.out.println(rankList.get(i).getRankBenefit());
				if (rankList.get(i).getRankBenefit().equals(today)) {

					if (rankList.get(i).getRankMemrank().equals("WHITE")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartWhiteMember(rankList.get(i).getMemberId());
						}
						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
					if (rankList.get(i).getRankMemrank().equals("YELLOW")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartYellowMember(rankList.get(i).getMemberId());
						}
						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
					if (rankList.get(i).getRankMemrank().equals("PURPLE")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartPurpleMember(rankList.get(i).getMemberId());
						}
						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
					if (rankList.get(i).getRankMemrank().equals("RAINBOW")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartRainbowMember(rankList.get(i).getMemberId());

						}

						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
				}

			}

		}
		req.setAttribute("rankList", rankList);
		
		
		
		//3.회원정보 조회
		MemberVO mv = memberService.getMember(memberId);
		
		
	/*	if(mv.getAtchFileId() > 0) { //첨부파일이 존재하면...
			//첨부파일 정보 조회
			  AtchFileVO fileVO = new AtchFileVO();
			  fileVO.setAtchFileId(mv.getAtchFileId());
			  List<AtchFileVO> atchFileList = null;
			  try {
			  atchFileList = fileService.getAtchFileList(fileVO);
			} catch (Exception ex) {
                  ex.printStackTrace();
			}
			  req.setAttribute("atchFileList", atchFileList);
		}*/
	    req.setAttribute("mv", mv);
	   
	  
	   
	   //결과를 VIEW화면에 출력하기
	   req.getRequestDispatcher("/WEB-INF/views/member/myPageDetail.jsp").forward(req, resp);	
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
