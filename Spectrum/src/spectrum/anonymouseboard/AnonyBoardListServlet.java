package spectrum.anonymouseboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/anonyboard/anonylist")
public class AnonyBoardListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 List<AnonymouseBoardVO> anonyList=AnonymouseBoardService.getInstance().boardList();
		 req.setAttribute("anonyList", anonyList);
		 RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/WEB-INF/views/anonyboard/anonyboardlist.jsp");
			dispatcher.forward(req, resp);
		 
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
