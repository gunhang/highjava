package spectrum.mbtiSurvey.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiSurvey.dao.MbtiSurveyDao;
import spectrum.mbtiSurvey.vo.MbtiSurveyVO;

@WebServlet("/mbtiSurvey/update.do")
public class UpdateMbtiSurveyServlet extends HttpServlet{
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터정보 가져오기
		String mbtiSurveyNumber = req.getParameter("mbtiSurveyNumber");

		// 2.서비스 객체 가져오기
		MbtiSurveyDao surveyDao = MbtiSurveyDao.getInstasnce();
		// 3.회원정보 조회
		MbtiSurveyVO vo = surveyDao.getMbtiSurvey(mbtiSurveyNumber);

		req.setAttribute("vo", vo);
		
		// 4. 업데이트 화면으로 포워딩
		req.getRequestDispatcher("/WEB-INF/views/mbtiSurvey/updateForm.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청 파라미터 정보 가져오기
		String mbtiSurveyNumber = req.getParameter("mbtiSurveyNumber");
		String mbtiSurveyContent = req.getParameter("mbtiSurveyContent");
		String mbtiSurveyType = req.getParameter("mbtiSurveyType");
		String mbtiSurveyAddyn = req.getParameter("mbtiSurveyAddyn");

		// 2. 서비스 객체 생성하기
		MbtiSurveyDao surveyDao = MbtiSurveyDao.getInstasnce();
		
		
		// 3. 회원정보 수정
		MbtiSurveyVO vo = new MbtiSurveyVO(mbtiSurveyNumber, mbtiSurveyContent, mbtiSurveyType, mbtiSurveyAddyn);
		
		
		int cnt = surveyDao.updateMbtiSurvey(vo);

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

}
