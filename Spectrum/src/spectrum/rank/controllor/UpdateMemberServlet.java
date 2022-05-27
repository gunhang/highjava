package spectrum.rank.controllor;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.rank.service.IRankService;
import spectrum.rank.service.RankServiceImpl;
import spectrum.rank.vo.RankVO;

@WebServlet("/rank/rankupdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)
public class UpdateMemberServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String memberId = req.getParameter("memberId");
				
		// 2. 서비스 객체 가져오기
		IRankService rankService =
				RankServiceImpl.getInstance();
	
		// 3. 회원정보 조회
		RankVO rv = rankService.getRankMember(memberId);
		
		

		
		req.setAttribute("rv", rv);
		
		
		// 4. 업데이트 화면으로 포워딩
		req.getRequestDispatcher("/WEB-INF/views/rank/updaterankForm.jsp")
			.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
		String memberId = req.getParameter("memberId");
		String rankMemrank = req.getParameter("rankMemrank");
		
		
		// 2. 서비스 객체 생성하기
		IRankService rankService =
				RankServiceImpl.getInstance();
	
		// 3. 회원정보 수정
		
		RankVO rv = new RankVO();
		rv.setMemberId(memberId);
		rv.setRankMemrank(rankMemrank);
		
		
		int cnt = rankService.updateRankMember(rv);
		
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
		String redirecturl =req.getContextPath() + "/rank/rankdetail.do?memberId="+rv.getMemberId()+"&msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
