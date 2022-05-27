package spectrum.mbtiboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
@WebServlet("/mbtiboard/mbtiboardreupdate")
public class MbtiBoardReUpdate extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiboardPostnum= (String)req.getParameter("mbtiboardPostnum");
		
		MbtiBoardVO mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiboardPostnum);
		req.setAttribute("mv", mv);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardreupdate.jsp");
		dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mbtiBoardPostnum =req.getParameter("mbtiBoardPostnum");
		String boardContent = req.getParameter("boardContent");
		
		
		MbtiBoardVO mv = new MbtiBoardVO();
		mv.setmbtiboardPostnum(mbtiBoardPostnum);
		mv.setmbtiboardContent(boardContent);
		int cnt =MbtiBoardService.getInstance().mbtiBoardReUpdate(mv);
		 
		mbtiBoardPostnum = MbtiBoardService.getInstance().mbtiparent(mbtiBoardPostnum);
		req.setAttribute("mbtiBoardPostnum", mbtiBoardPostnum);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/mbtiboard/mbtiboarddetail");
		requestDispatcher.forward(req, resp);
	
	}
	
}
