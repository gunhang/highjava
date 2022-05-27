package spectrum.myspectrum.boardre.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.myspectrum.boardre.service.MyspectrumBoardReService;
@WebServlet("/myspectrumboardre/spectrumboardredelete")
public class MyspectrumBoardReDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String boardPostnum =req.getParameter("boardPostNum");
		
		System.out.println(boardPostnum);
		MyspectrumBoardReService.getInstance().spectrumBoardDelete(boardPostnum);
		
		MyspectrumBoardReService.getInstance().parent(boardPostnum);
		
		req.setAttribute("postNum", boardPostnum);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/mySpectrumDetail.do");
		requestDispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
