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
@WebServlet("/mbtiboard/mbtiboardupdate")
public class MbtiBoardUpdate extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiboardPostnum= (String)req.getParameter("mbtiboardPostnum");
		
		MbtiBoardVO mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiboardPostnum);
		req.setAttribute("mv", mv);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardupdate.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiBoardPostnum =req.getParameter("mbtiBoardPostnum");
		String mbtiBoardTitle =req.getParameter("mbtiBoardTitle");
		String boardContent = req.getParameter("boardContent");
		String mbtiBoardTypeCode =req.getParameter("mbtiBoardTypeCode");
		
		String mbtiBoard = req.getParameter("mbtiBoard");
		req.setAttribute("mbtiBoardInsert", mbtiBoard);
		
		MbtiBoardVO mv = new MbtiBoardVO();
		mv.setmbtiboardPostnum(mbtiBoardPostnum);
		mv.setmbtiboardTitle(mbtiBoardTitle);
		mv.setmbtiboardContent(boardContent);
		mv.setmbtiboardTypecode(mbtiBoardTypeCode);
		int cnt = MbtiBoardService.getInstance().mbtiBoardUdate(mv);
		String msg="";
		if(cnt>0) {
			msg = "성공";
			
			
		}else {
			msg = "실패";
			
		}
		
		req.setAttribute("msg", msg);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/mbtiboard/mbtiboardlist");
		requestDispatcher.forward(req, resp);
		
		
	}
}
