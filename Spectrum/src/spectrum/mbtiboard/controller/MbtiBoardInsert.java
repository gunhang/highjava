package spectrum.mbtiboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.board.atch.AtchFileServiceImpl;
import spectrum.board.atch.AtchFileVO;
import spectrum.board.atch.IAtchFileService;
import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
@WebServlet("/mbtiboard/mbtiboardinsert")
@MultipartConfig(fileSizeThreshold = 1024*1204*3
, maxFileSize = 1024*1024*40
, maxRequestSize = 1024*1024*50)
public class MbtiBoardInsert extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbtiBoard =req.getParameter("mbtiBoard");
		req.setAttribute("mbtiBoard",mbtiBoard);
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboardinsert.jsp");
		dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		String mbti=req.getParameter("mbti");
		String typecode=req.getParameter("Typecode");
		String mbtiboardTitle=req.getParameter("mbtiboardTitle");
		String memberId=req.getParameter("memberId");
		String mbtiboardContent=req.getParameter("mbtiboardContent");
		
		IAtchFileService fileService =
				AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO =null;
		try {
			atchFileVO = fileService.saveAtchFileList(req);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(atchFileVO==null) {
			atchFileVO = new AtchFileVO();
		}
	
		
		
		
		req.setAttribute("mbtiBoardInsert", mbti);
		MbtiBoardVO mv = new MbtiBoardVO();
		mv.setmbtiboardClassificationcode(mbti);
		mv.setmbtiboardTypecode(typecode);
		mv.setmbtiboardTitle(mbtiboardTitle);
		mv.setmemberId(memberId);
		mv.setmbtiboardContent(mbtiboardContent);
		mv.setBoardAttachmentId(atchFileVO.getBoardAttachmentId());
		int cnt =MbtiBoardService.getInstance().mbtiBoardInsert(mv);
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
