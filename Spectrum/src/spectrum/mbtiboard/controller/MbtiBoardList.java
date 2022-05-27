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

@WebServlet("/mbtiboard/mbtiboardlist")
public class MbtiBoardList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mbtiInsert = (String)req.getAttribute("mbtiBoardInsert");
		String mbti=req.getParameter("mbtiBoard");
		List<MbtiBoardVO> mbl;
		int end=1;
		String start="1";
		if(req.getParameter("end")!=null){
			end=Integer.parseInt(req.getParameter("end"));
		}
		if(req.getParameter("start")!=null) {
			if(req.getParameter("start").equals("0")) {
				start="0";
			}
		}
		MbtiBoardVO mv = new MbtiBoardVO();
		mv.setStart(start);
		mv.setEnd(String.valueOf(end));
		
		if(mbtiInsert==null) {
			mv.setmbtiboardClassificationcode(mbti);
			mbl=MbtiBoardService.getInstance().mbtiBoardList(mv);
			req.setAttribute("mbtiBoardList", mbl);
			req.setAttribute("mbtiBoard", mbti);
		}else {
			mv.setmbtiboardClassificationcode(mbtiInsert);
			mbl=MbtiBoardService.getInstance().mbtiBoardList(mv);
			req.setAttribute("mbtiBoardList", mbl);
			req.setAttribute("mbtiBoard", mbtiInsert);
		}
		
		req.setAttribute("mbtiBoardList", mbl);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardlist.jsp");
		dispatcher.forward(req, resp);
		
	
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
		
}
