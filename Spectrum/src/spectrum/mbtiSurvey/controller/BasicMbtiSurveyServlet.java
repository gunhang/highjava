package spectrum.mbtiSurvey.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.mbtiResult.dao.MbtiResultDao;
import spectrum.mbtiResult.vo.MbtiResultVO;
import spectrum.mbtiSurvey.dao.MbtiSurveyDao;
import spectrum.mbtiSurvey.vo.MbtiIndicatorVO;
import spectrum.mbtiSurvey.vo.MbtiSurveyVO;
import spectrum.member.vo.MemberVO;

@WebServlet("/mbtiSurvey/basicSurvey.do")
public class BasicMbtiSurveyServlet extends HttpServlet{
	// DAO 객체 생성
	MbtiSurveyDao surveyDao = MbtiSurveyDao.getInstasnce();

	
	// 검사문항 가져오기
	List<MbtiSurveyVO> surveyList = surveyDao.getBasicMbtiSurveyList();
	
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// list 랜덤 정렬
		Collections.shuffle(surveyList);
		
		// req에 담기
		req.setAttribute("surveyList", surveyList);

		// 포워드 객체 생성
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mbtiSurvey/basicMbtiSurvey.jsp");
		dispatcher.forward(req, resp); // 뷰페이지로 전달
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MbtiResultDao resultDao = MbtiResultDao.getInstasnce();
		MbtiResultVO mbtiResultVO = new MbtiResultVO();
		MbtiIndicatorVO indicatorVO = new MbtiIndicatorVO();
		HttpSession session = req.getSession();
		
		for (MbtiSurveyVO vo : surveyList) {
			switch (vo.getMbtiSurveyType()) {
			case "EI":
				indicatorVO.setMbtiIndicatorsEI(indicatorVO.getMbtiIndicatorsEI()+ Double.parseDouble(req.getParameter(vo.getMbtiSurveyNumber())));
				break;
			case "SN":
				indicatorVO.setMbtiIndicatorsSN(indicatorVO.getMbtiIndicatorsSN()+Double.parseDouble(req.getParameter(vo.getMbtiSurveyNumber())));
				break;
			case "TF":
				indicatorVO.setMbtiIndicatorsTF(indicatorVO.getMbtiIndicatorsTF()+Double.parseDouble(req.getParameter(vo.getMbtiSurveyNumber())));
				break;
			case "JP":
				indicatorVO.setMbtiIndicatorsJP(indicatorVO.getMbtiIndicatorsJP()+Double.parseDouble(req.getParameter(vo.getMbtiSurveyNumber())));
				break;
			}
		}
		
		indicatorVO.changeBasicValues();
		String mbtiCode = indicatorVO.getMbtiCode();
		req.setAttribute("indicatorVO", indicatorVO);
		
		String memberId = (String) session.getAttribute("memberId");
		resultDao.insertBasicMbtiResult(new MbtiResultVO(mbtiCode, memberId, indicatorVO));
		resultDao.updateMbtiResultLatestN(memberId);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(memberId);
		memberVO.setMbticode(mbtiCode);
		resultDao.updateMbtiCodeMember(memberVO);
		session.setAttribute("mbtiCode", mbtiCode);
		
		mbtiResultVO = resultDao.getMbtiResult(memberId);
		req.setAttribute("mbtiResultVO", mbtiResultVO);
		req.getRequestDispatcher("/WEB-INF/views/mbtiResult/"+mbtiCode+".jsp").forward(req, resp);
		
	}
	
}
