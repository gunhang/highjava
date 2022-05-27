package spectrum.myspectrum.boardre.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicOptionPaneUI.ButtonAreaLayout;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.myspectrum.boardre.service.MyspectrumBoardReService;
import spectrum.myspectrum.vo.SpectrumBoardVO;


@WebServlet("/myspectrumboardre/spectrumboardrelist")
public class MyspectrumBoardReList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<SpectrumBoardVO> sbv;
		String boardNum=req.getParameter("boardNum");
		
		
		
		sbv=MyspectrumBoardReService.getInstance().spectrumBoardReSelect(boardNum);
		
	
		
		req.setAttribute("sbv", sbv);	
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/myspectrumboardre/myspectrumboardre.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
}
