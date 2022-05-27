package spectrum.myatc.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.membership.MemberImpl;

import spectrum.member.service.MemberService;
import spectrum.myatc.service.IMyAtcService;
import spectrum.myatc.service.MyAtcServiceImpl;
import spectrum.myatc.vo.MyAtcVO;

@WebServlet("/member/atcupdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*3,
		maxFileSize = 1024*1024*40,
		maxRequestSize = 1024*1024*50)
public class MyAtcUpdateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	/*	// 1. 파라미터 정보 가져오기
		String memId = req.getParameter("memId");
				*/
		// 2. 서비스 객체 가져오기
		MemberService memberService =
				spectrum.member.service.MemberServiceImpl.getInstance();
		/*IAtchFileService fileService =
				AtchFileServiceImpl.getInstance();*/
		IMyAtcService fileService = MyAtcServiceImpl.getInstance();
		  HttpSession session = req.getSession();
		  String memberId =(String)session.getAttribute("memberId");
		
		
		// 3. 회원정보 조회
	spectrum.member.vo.MemberVO mv = memberService.getMember(memberId);
		int atcId =Integer.valueOf(fileService.getAtcId(memberId));
		
		if(atcId > 0) { // 첨부파일이 존재하면...
			// 첨부파일 정보 조회
			MyAtcVO fileVO = new MyAtcVO();
			fileVO.setMyflofileatcId(atcId);
			List<MyAtcVO> atchFileList = null;
			try {
				atchFileList = fileService.getAtchFileList(fileVO);
				
			}catch (Exception ex) {
				ex.printStackTrace();
			}
			req.setAttribute("atchFileList", atchFileList);
			req.setAttribute("atcId", atcId);
		}
		
		req.setAttribute("mv", mv);
		
		
		// 4. 업데이트 화면으로 포워딩
		req.getRequestDispatcher("/WEB-INF/views/member/myatcupdate.jsp")
			.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 파라미터 정보 가져오기
		
		String atchFileId = req.getParameter("atchFileId");
		
		// 2. 서비스 객체 생성하기

		IMyAtcService fileService = MyAtcServiceImpl.getInstance();
		  HttpSession session = req.getSession();
		  String memberId =(String)session.getAttribute("memberId");
	
		
		MyAtcVO atchFileVO = null;
		
		try {
			// 첨부파일 목록 저장(공통기능)
			atchFileVO = fileService.saveAtchFileList(req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 3. 회원정보 수정
		
	
		if(atchFileVO == null) { //신규 첨부파일이 존재하지 않는 경우...
			atchFileVO.setMyflofileatcId(Long.parseLong(atchFileId));
		} else {
			atchFileVO.setMyflofileatcId(atchFileVO.getMyflofileatcId());
		}
		
	
		int cnt = fileService.updateAtcId(atchFileVO);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		
		// 4. 목록 조회화면으로 이동
		/*req.getRequestDispatcher("/member/list.do")
			.forward(req, resp);*/
		String redirecturl =req.getContextPath() + "/mySpectrumList.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirecturl); // 목록조회 화면으로 리다이렉트
		
	}
}
