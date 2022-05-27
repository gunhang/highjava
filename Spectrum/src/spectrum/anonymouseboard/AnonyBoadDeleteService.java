package spectrum.anonymouseboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
@WebServlet("/anonyboard/anonydelete")
public class AnonyBoadDeleteService extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String postNum =req.getParameter("postNum");
		
	    
		AnonymouseBoardService.getInstance().boardDelete(postNum);
	    RequestDispatcher dispatcher = 
				req.getRequestDispatcher("anonylist");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	
	}
	
}
