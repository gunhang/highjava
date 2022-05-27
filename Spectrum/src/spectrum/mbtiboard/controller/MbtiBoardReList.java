package spectrum.mbtiboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicOptionPaneUI.ButtonAreaLayout;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;


@WebServlet("/mbtiboard/mbtiboardrelist")
public class MbtiBoardReList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<MbtiBoardVO> mvl;
		String boardNum=req.getParameter("mbtiBoardNum");
		String mbtiBoardNum;
		
		mbtiBoardNum=(String)req.getAttribute("mbtiBoardNum");
		req.setAttribute("mbtiBoardNum",mbtiBoardNum);
		
		
		
		
		
		mvl=MbtiBoardService.getInstance().mbtiBoardReSelect(boardNum);
		if(mvl.size()<1) {
			
			String mbtiBoard=MbtiBoardService.getInstance().mbtiBoardCode(boardNum); 
			req.setAttribute("mbtiBoard", mbtiBoard);
		}
		
		req.setAttribute("mvl", mvl);	
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardRe.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
}
