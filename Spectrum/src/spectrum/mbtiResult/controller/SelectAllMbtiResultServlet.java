package spectrum.mbtiResult.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiResult.dao.MbtiResultDao;
import spectrum.mbtiResult.vo.MbtiResultVO;

@WebServlet("/mbtiResult/list.do")
public class SelectAllMbtiResultServlet extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			// 1. DAO 객체 생성하기
			MbtiResultDao resultDao = MbtiResultDao.getInstasnce();
			
			// 2. 검사문항 전체 가져오기
			List<MbtiResultVO> resultList = resultDao.getMbtiResultAll();
			
			req.setAttribute("resultList", resultList);
			
			// 포워드 객체 생성
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mbtiResult/list.jsp");
			dispatcher.forward(req, resp); // 뷰페이지로 전달

		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
	}