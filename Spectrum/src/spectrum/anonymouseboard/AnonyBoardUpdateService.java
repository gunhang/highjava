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
@WebServlet("/anonyboard/anonyupdate")
public class AnonyBoardUpdateService extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String postNum= (String)req.getParameter("postNum");
		
		AnonymouseBoardVO av = AnonymouseBoardService.getInstance().boardDetail(postNum);
		req.setAttribute("av", av);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/anonyboard/anonyboardupdate.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String anonyBoardPostnum =req.getParameter("anonyBoardPostnum");
		String anonyBoardTitle =req.getParameter("anonyBoardTitle");
		String boardContent = req.getParameter("boardContent");
		
		
		AnonymouseBoardVO av = new AnonymouseBoardVO();
		av.setAnonymouseboardPostnum(anonyBoardPostnum);
		av.setAnonymouseboardTitle(anonyBoardTitle);
		av.setAnonymouseboardContent(boardContent);
		
		AnonymouseBoardService.getInstance().boardUpdate(av);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/anonyboard/anonylist");
		requestDispatcher.forward(req, resp);
		
		
	}
}
