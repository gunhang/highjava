package spectrum.mbtiboard.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
@WebServlet("/mbtiboard/mbtiboardreinsert")
public class MbtiBoardReInsert extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiBoard=req.getParameter("mbtiBoard");
		String mbtiBoardNum=req.getParameter("mbtiBoardNum");
		req.setAttribute("mbtiBoard", mbtiBoard);
		req.setAttribute("mbtiBoardNum", mbtiBoardNum);
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardreinsert.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiBoard=req.getParameter("mbti");
		String mbtiBoardNum=req.getParameter("mbtiBoardNum");
		String memberId=req.getParameter("memberId");
		String mbtiboardContent=req.getParameter("mbtiboardContent");
		
		MbtiBoardVO mv = new MbtiBoardVO();
		
		mv.setmbtiboardClassificationcode(mbtiBoard);
		mv.setmbtiboardParentpostnum(mbtiBoardNum);
		mv.setmemberId(memberId);
		mv.setmbtiboardContent(mbtiboardContent);
		
		mv.setmbtiboardLevel("1");
		MbtiBoardService.getInstance().mbtiBoardReInsert(mv);
		
		
		mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiBoardNum);
		req.setAttribute("mv",mv);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboarddetail.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
}
