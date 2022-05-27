package spectrum.mbtiboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
@WebServlet("/mbtiboard/mbtiboardredelete")
public class MbtiBoardReDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mbtiBoardPostnum =req.getParameter("mbtiboardPostnum");
		String delete = mbtiBoardPostnum;
		
		
		mbtiBoardPostnum = MbtiBoardService.getInstance().mbtiparent(mbtiBoardPostnum);
		req.setAttribute("mbtiBoardPostnum", mbtiBoardPostnum);
		MbtiBoardService.getInstance().mbtiBoardDelete(delete);
		System.out.println(mbtiBoardPostnum);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/mbtiboard/mbtiboarddetail");
		requestDispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
