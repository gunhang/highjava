package spectrum.mbtiboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.board.atch.AtchFileServiceImpl;
import spectrum.board.atch.AtchFileVO;
import spectrum.board.atch.IAtchFileService;
import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;


@WebServlet("/mbtiboard/mbtiboarddetail")
public class MbtiBoardDetail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MbtiBoardVO mv = null;
		
		String mbtiboardPostnum = req.getParameter("mbtiboardPostnum");
		if(mbtiboardPostnum==null) {
			mbtiboardPostnum = (String)req.getAttribute("mbtiBoardPostnum");
		}else if(mbtiboardPostnum!=null&&(String)req.getAttribute("mbtiBoardPostnum")!=null) {
			mbtiboardPostnum = (String)req.getAttribute("mbtiBoardPostnum");
		}
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiboardPostnum);
		
		if(!mv.getBoardAttachmentId().equals("-1")) {// 첨부파일이 존재하면...
			// 첨부파일 정보 조회
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setBoardAttachmentId(mv.getBoardAttachmentId());
			List<AtchFileVO> atchFileList = null;
			
			try {
				atchFileList =	fileService.getAtchFileList(fileVO);
				
				
			}catch (Exception e) {
				e.printStackTrace();
			
			}
			req.setAttribute("atchFileList",atchFileList);
		};
		
		
		req.setAttribute("mv", mv);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboarddetail.jsp");
		dispatcher.forward(req, resp);
	
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	
	}
}
