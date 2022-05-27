package spectrum.rank.controllor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.rank.service.IRankService;
import spectrum.rank.service.RankServiceImpl;
import spectrum.rank.vo.RankVO;

@WebServlet("/rank/rankdetail.do")
public class DeatilRankMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String memberId = req.getParameter("memberId");
		
		// 2. 서비스 객체 가져오기
		IRankService rankService = RankServiceImpl.getInstance();
		
		
		// 3. 회원정보 조회
		RankVO rv = rankService.getRankMember(memberId);
		
	
		req.setAttribute("rv", rv);
		
		// 결과를 VIEW화면에 출력하기
		req.getRequestDispatcher("/WEB-INF/views/rank/rankdetail.jsp")
				.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
