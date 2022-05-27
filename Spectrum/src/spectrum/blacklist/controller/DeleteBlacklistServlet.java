package spectrum.blacklist.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.blacklist.service.BlacklistServiceImpl;
import spectrum.blacklist.service.IBlacklistService;


@WebServlet("/blacklist/blacklistdelete.do")
public class DeleteBlacklistServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 파라미터 정보 가져오기
		String blacklistNumber = req.getParameter("blacklistNumber");

		// 2. 서비스 객체 가져오기
		IBlacklistService blackService = BlacklistServiceImpl.getInstance();

		// 3. 회원정보 삭제
		int cnt = blackService.deleteBlacklist(blacklistNumber);

		String msg = "";
		if (cnt > 0) { 
			msg = "성공";
		} else {
			msg = "실패!";
		}

		req.setAttribute("msg", msg);
		
		// 4. 목록 조회화면으로 이동

		String redirectUrl = req.getContextPath() + "/blacklist/blacklistdetail.do?msg=" + URLEncoder.encode(msg, "UTF-8")+"&&blacklistNumber=" +blacklistNumber;

		resp.sendRedirect(redirectUrl); // 목록조회 화면으로 리다이렉트
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
