package spectrum.mbtiSurvey.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiSurvey.dao.MbtiSurveyDao;
import spectrum.mbtiSurvey.vo.MbtiSurveyVO;

@WebServlet("/mbtiSurvey/list.do")
public class SelectAllMbitSurveyServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. DAO 객체 생성하기
		MbtiSurveyDao surveyDao = MbtiSurveyDao.getInstasnce();
		
		// 2. 검사문항 전체 가져오기
		List<MbtiSurveyVO> surveyList = surveyDao.getAllMbtiSurveyList();
		
		req.setAttribute("surveyList", surveyList);
		
		// 포워드 객체 생성
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mbtiSurvey/list.jsp");
		dispatcher.forward(req, resp); // 뷰페이지로 전달

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
