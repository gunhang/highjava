package spectrum.myspectrum.boardre.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
import spectrum.myspectrum.boardre.service.MyspectrumBoardReService;
import spectrum.myspectrum.vo.SpectrumBoardVO;
@WebServlet("/myspectrumboardre/spectrumboardreupdate")
public class MyspectrumBoardReUpdate extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardPostnum= (String)req.getParameter("boardPostnum");
		
		 // 메소드(boardPostnum
	//	req.setAttribute("mv", mv);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/mySpectrumDetail.do");
		dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String boardPostnum =req.getParameter("boardPostnum");
		String boardContent = req.getParameter("boardContent");
		
		
		SpectrumBoardVO sv = new SpectrumBoardVO();
		sv.setSpecbrdSrlnmbr(boardPostnum);
		sv.setSpecbrdCn(boardContent);
		MyspectrumBoardReService.getInstance().spectrumBoardUpdate(sv);
		 
		//boardPostnum = MbtiBoardService.getInstance().mbtiparent(boardPostnum);
		req.setAttribute("boardPostnum", boardPostnum);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/mySpectrumList.do");
		requestDispatcher.forward(req, resp);
	
	}
	
}
