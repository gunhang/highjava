package spectrum.anonymouseboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;


@WebServlet("/anonyboard/anonydetail")
public class AnonyBoardDetailServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AnonymouseBoardVO av = null;
		
		String postNum = req.getParameter("postNum");
		
		
		av = AnonymouseBoardService.getInstance().boardDetail(postNum);
		
		req.setAttribute("av", av);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/anonyboard/anonyboarddetail.jsp");
		dispatcher.forward(req, resp);
	
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	
	}
}
