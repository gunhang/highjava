package spectrum.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.ISpectrumAtchFileService;
import kr.or.ddit.comm.service.SpectrumAtchFileServiceImpl;
import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;
import spectrum.myspectrum.vo.SpectrumAttachFileVO;
import spectrum.myspectrum.vo.SpectrumBoardVO;



@WebServlet("/mySpectrumDetail.do")
public class DetailMySpectrumServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터정보 가져오기
	    String postNum = null;
	    postNum =req.getParameter("postNum");
	    
	    if(postNum == null) {
	    	postNum = (String)req.getAttribute("postNum");
	    }
	    req.getAttribute(postNum);
		//2.서비스 객체 가져오기
		MemberService memberService = MemberServiceImpl.getInstance();
		ISpectrumAtchFileService fileService = SpectrumAtchFileServiceImpl.getInstance();
		
		//3.회원정보 조회
		SpectrumBoardVO sv = memberService.getBoard(postNum);
		
		
		if(sv.getSpctatcId() > 0) { //첨부파일이 존재하면...
			//첨부파일 정보 조회
			SpectrumAttachFileVO fileVO = new SpectrumAttachFileVO();
			  fileVO.setSpctatcId(sv.getSpctatcId());
			  List<SpectrumAttachFileVO> atchFileList = null;
			  try {
			  atchFileList = fileService.getAtchFileList(fileVO);
			} catch (Exception ex) {
                  ex.printStackTrace();
			}
			  req.setAttribute("atchFileList", atchFileList);
		}
	    req.setAttribute("sv", sv);
	   
	  
	   
	   //결과를 VIEW화면에 출력하기
	   req.getRequestDispatcher("/WEB-INF/views/member/mySpectrumDetail.jsp").forward(req, resp);	
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
