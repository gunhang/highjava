package spectrum.blacklist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.blacklist.service.BlacklistServiceImpl;
import spectrum.blacklist.service.IBlacklistService;
import spectrum.blacklist.vo.BlacklistVO;

@WebServlet("/blacklist/blacklistdetail.do")
public class DetailBlacklistServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		String blacklistNumber = req.getParameter("blacklistNumber");
		
		// 2. 서비스 객체 가져오기
		IBlacklistService blackService = BlacklistServiceImpl.getInstance();
		
		
		// 3. 회원정보 조회
		BlacklistVO bv = blackService.getBlacklist(blacklistNumber);
		
		req.setAttribute("bv", bv);
		
		// 결과를 VIEW화면에 출력하기
		req.getRequestDispatcher("/WEB-INF/views/blacklist/blacklistdetail.jsp")
				.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
