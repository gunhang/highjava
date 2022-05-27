package spectrum.mbtiSurvey.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiSurvey.dao.MbtiSurveyDao;

@WebServlet("/mbtiSurvey/delete.do")
public class DeleteMbtiSurveyServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiSurveyNumber = req.getParameter("mbtiSurveyNumber");
		MbtiSurveyDao surveyDao = MbtiSurveyDao.getInstasnce();
		
		int cnt = surveyDao.deleteMbtiSurvey(mbtiSurveyNumber);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		req.setAttribute("msg", msg);

		
		// 리다이렉트
		String redirectUrl = req.getContextPath() + "/mbtiSurvey/list.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		resp.sendRedirect(redirectUrl); // 목록조회 화면으로 리다이렉트
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
