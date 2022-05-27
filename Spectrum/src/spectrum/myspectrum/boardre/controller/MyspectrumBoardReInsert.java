package spectrum.myspectrum.boardre.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.myspectrum.boardre.service.MyspectrumBoardReService;
import spectrum.myspectrum.vo.SpectrumBoardVO;
@WebServlet("/myspectrumboardre/spectrumboardreinsert")
public class MyspectrumBoardReInsert extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNum=req.getParameter("boardNum");
		req.setAttribute("boardNum", boardNum);
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/myspectrumboardre/myspectrumboardreinsert.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String boardNum=req.getParameter("boardNum");
		String memberId=(String)session.getAttribute("memberId");
		String boardContent=req.getParameter("boardContent");
		
		SpectrumBoardVO sbv= new SpectrumBoardVO();
		
		sbv.setSpecbrdParentserialnum(boardNum);
		sbv.setMemberId(memberId);
		sbv.setSpecbrdCn(boardContent);
		
		
		MyspectrumBoardReService.getInstance().spectrumBoardInsert(sbv);
		
		// 수정 출력페이지 세팅
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/mySpectrumList.do"); // 경로수정
		dispatcher.forward(req, resp);
		
		
		
	}
}
