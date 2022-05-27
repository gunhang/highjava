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
import spectrum.blacklist.vo.BlacklistVO;

@WebServlet("/blacklist/blacklistinsert.do")
public class InsertBlacklistServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/blacklist/blacklistinsertForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 요청 파라미터 정보 가져오기
		String blacklistNumber = req.getParameter("blacklistNumber");
		String memberId = req.getParameter("memberId");
		String blacklistReason = req.getParameter("blacklistReason");
		String blacklistRgstrdate = req.getParameter("blacklistRgstrdate");
		String blacklistBlackyn = req.getParameter("blacklistBlackyn");
		String blacklistReleasedate = req.getParameter("blacklistReleasedate");
		
		// 2. 서비스 객체 생성하기
		IBlacklistService blackService = BlacklistServiceImpl.getInstance();

		// 3. 회원정보 등록
		BlacklistVO bv = new BlacklistVO();
		bv.setBlacklistNumber(blacklistNumber);
		bv.setMemberId(memberId);
		bv.setBlacklistReason(blacklistReason);
		bv.setBlacklistRgstrdate(blacklistRgstrdate);
		bv.setBlacklistBlackyn(blacklistBlackyn);
		bv.setBlacklistReleasedate(blacklistReleasedate);

		int cnt = blackService.insertBlacklist(bv);

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패!";
		}

		req.setAttribute("msg", msg);

		// 4. 목록 조회화면으로 이동
		// req.getRequestDispatcher("/member/list.do").forward(req, resp);

		String redirectUrl = req.getContextPath() + "/blacklist/blacklistlist.do?msg=" + URLEncoder.encode(msg, "UTF-8");

		resp.sendRedirect(redirectUrl); // 목록조회 화면으로 리다이렉트

	}
}
