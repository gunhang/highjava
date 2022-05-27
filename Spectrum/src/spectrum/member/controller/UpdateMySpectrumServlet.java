package spectrum.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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

@WebServlet("/mySpectrumUpdate.do")
@MultipartConfig(fileSizeThreshold = 1024*1024*3, maxFileSize=1024*1224*40, maxRequestSize=1024*1024*50)
public class UpdateMySpectrumServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터정보 가져오기
				String boardNum = req.getParameter("boardNum");
				
				//2.서비스 객체 가져오기
				MemberService memberService = MemberServiceImpl.getInstance();
				
				ISpectrumAtchFileService fileService = SpectrumAtchFileServiceImpl.getInstance();
				
				//3.회원정보 조회
				SpectrumBoardVO sv = memberService.getBoard(boardNum);
				
				if(sv.getSpctatcId() > 0) { //첨부파일이 존재하면...
					//첨부파일 정보 조회
					SpectrumAttachFileVO fileVO = new SpectrumAttachFileVO();;
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
			   
		        //4. 업데이트 화면으로 포워딩
	             req.getRequestDispatcher("/WEB-INF/views/member/mySpectrumUpdateForm.jsp").forward(req, resp);
	

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	         
		//1.요청 파라미터 정보 가져오기		
         String memberId = req.getParameter("memberId");
         String specbrdSrlnmbr = req.getParameter("specbrdSrlnmbr");
         String specbrdCn = req.getParameter("specbrdCn");
         String specbrdLikenum = req.getParameter("specbrdLikenum");
         String specbrdParentserialnum = req.getParameter("specbrdParentserialnum");
         String specbrdDate = req.getParameter("specbrdDate");        
         String spctatcId = req.getParameter("spctatcId");
	

		//2.서비스 객체 생성하기
		MemberService memberService = MemberServiceImpl.getInstance();
		ISpectrumAtchFileService fileService = SpectrumAtchFileServiceImpl.getInstance();
		SpectrumAttachFileVO atchFileVO = null;
		
		try{
		//첨부파일 목록 저장(공통기능)
	    atchFileVO = fileService.saveAtchFileList(req);
		}catch (Exception e) {
           e.printStackTrace();
		}

		//3.회원정보  수정
		SpectrumBoardVO sv = new SpectrumBoardVO();
		sv.setMemberId(memberId);
		sv.setSpecbrdSrlnmbr(specbrdSrlnmbr);
		sv.setSpecbrdCn(specbrdCn);
		sv.setSpecbrdLikenum(specbrdLikenum);
		sv.setSpecbrdParentserialnum(specbrdParentserialnum);
		sv.setSpecbrdDate(specbrdDate);
		
		if(atchFileVO ==null) {  //신규 첨부파일이 존재하지 않는 경우...
			//Long.parseLong(atchFileId)
			sv.setSpctatcId(1);
		}else {
			sv.setSpctatcId(atchFileVO.getSpctatcId());
		}
	
		
		int cnt = memberService.updateBoard(sv);
		
		String msg = "";
		if(cnt>0) {
			msg="성공";
		}else {
			msg="실패";
		}
		
		req.setAttribute("msg", msg);
		
		//4. 목록 조회화면으로 이동
       /*   req.getRequestDispatcher("/detail.do").forward(req, resp);*/
             
		//요청한 것이 잘못됐을 때 올바른 주소를 알려줌 2번 적용
		String redirectUrl =
		req.getContextPath()+"/mySpectrumDetail.do?msg="
		                    +URLEncoder.encode(msg,"UTF-8");
		
		resp.sendRedirect(redirectUrl);//목록조회 화면으로 리다이렉트
             
}
}