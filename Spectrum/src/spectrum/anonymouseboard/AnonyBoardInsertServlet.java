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
@WebServlet("/anonyboard/anonyboardinsert")
public class AnonyBoardInsertServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/anonyboard/anonyboardinsert.jsp");
		dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		String typeCode=req.getParameter("Typecode");
		String anonyboardTitle= req.getParameter("anonyboardTitle");
		String memberId= req.getParameter("memberId");
		String anonyboardContent=req.getParameter("anonyboardContent");
		
		AnonymouseBoardVO av = new AnonymouseBoardVO();
		av.setAnonymouseboardType(typeCode);
		av.setAnonymouseboardTitle(anonyboardTitle);
		av.setMemberId(memberId);
		av.setAnonymouseboardContent(anonyboardContent);
		AnonymouseBoardService.getInstance().boardInsert(av);
		
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/anonyboard/anonylist");
		requestDispatcher.forward(req, resp);
		
		
	
	
	
	}
}
