package spectrum.mbtiboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
@WebServlet("/mbtiboard/mbtiboardserch")
public class MbtiBoardListSerch  extends HttpServlet{
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiBoard=req.getParameter("mbtiBoard");
		String serchValue = req.getParameter("searchValue");
		String serchKey = req.getParameter("searchKey");
		MbtiBoardVO mv = new MbtiBoardVO();
		mv.setmbtiboardClassificationcode(mbtiBoard);
		mv.setSearchKey(serchKey);
		mv.setSearchValue(serchValue);
		List<MbtiBoardVO> mbl = null; 
		
		mbl = MbtiBoardService.getInstance().serch(mv);
		
		req.setAttribute("mbtiBoard", mbtiBoard);
		req.setAttribute("mbtiBoardList", mbl);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardlist.jsp");
		dispatcher.forward(req, resp);
		
		
	
	}
	
	
}
