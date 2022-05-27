package spectrum.mbtiboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
@WebServlet("/mbtiboard/mbtiboarddelete")
public class MbtiBoadDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiboardPostnum =req.getParameter("mbtiboardPostnum");
		String mbtiboard = req.getParameter("mbtiBoard");
		req.setAttribute("mbtiBoardInsert", mbtiboard);
		
		
		
	    
		MbtiBoardService.getInstance().mbtiBoardDelete(mbtiboardPostnum);
	    RequestDispatcher dispatcher = 
				req.getRequestDispatcher("mbtiboardlist");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	
	}
	
}
