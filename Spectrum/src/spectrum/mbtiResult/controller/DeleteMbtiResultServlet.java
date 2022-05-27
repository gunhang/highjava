package spectrum.mbtiResult.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiResult.dao.MbtiResultDao;
import spectrum.mbtiResult.vo.MbtiResultVO;
import spectrum.member.vo.MemberVO;

@WebServlet("/mbtiResult/delete.do")
public class DeleteMbtiResultServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiResultUniquekey = req.getParameter("mbtiResultUniquekey");
		MbtiResultDao resultDao = MbtiResultDao.getInstasnce();
		MbtiResultVO mbtiResultByUniquekey = resultDao.getMbtiResultByUniquekey(mbtiResultUniquekey);
		int cnt = resultDao.deleteMbtiResult(mbtiResultUniquekey);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		String memberId = mbtiResultByUniquekey.getMemberId();
		resultDao.updateMbtiResultLatestY(memberId);
		MbtiResultVO resultVO = resultDao.getMbtiResult(memberId);
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(memberId);
		memberVO.setMbticode(resultVO.getMbtiCode());
		resultDao.updateMbtiCodeMember(memberVO);
		req.setAttribute("msg", msg);

		
		// 리다이렉트
		String redirectUrl = req.getContextPath() + "/mbtiResult/list.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		resp.sendRedirect(redirectUrl); // 목록조회 화면으로 리다이렉트
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
