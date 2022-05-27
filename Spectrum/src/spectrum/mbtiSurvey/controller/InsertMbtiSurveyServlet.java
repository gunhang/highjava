package spectrum.mbtiSurvey.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiSurvey.dao.MbtiSurveyDao;
import spectrum.mbtiSurvey.vo.MbtiSurveyVO;

@WebServlet("/mbtiSurvey/insert.do")
public class InsertMbtiSurveyServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/mbtiSurvey/insertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청 파라미터 정보 가져오기
		String mbtiSurveyContent = req.getParameter("mbtiSurveyContent");
		String mbtiSurveyType = req.getParameter("mbtiSurveyType");
		String mbtiSurveyAddyn = req.getParameter("mbtiSurveyAddyn");

		// 2. DAO 객체 생성하기

		MbtiSurveyDao surveyDao = MbtiSurveyDao.getInstasnce();

		// 3. 회원정보 등록
		MbtiSurveyVO vo = new MbtiSurveyVO();
		vo.setMbtiSurveyContent(mbtiSurveyContent);
		vo.setMbtiSurveyType(mbtiSurveyType);
		vo.setMbtiSurveyAddyn(mbtiSurveyAddyn);

		int cnt = surveyDao.insertMbtiSurvey(vo);

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		req.setAttribute("msg", msg);

		// 4. 목록 조회화면으로 이동
		// 리다이렉트
		String redirectUrl = req.getContextPath() + "/mbtiSurvey/list.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		resp.sendRedirect(redirectUrl); // 목록조회 화면으로 리다이렉트
	}

}
