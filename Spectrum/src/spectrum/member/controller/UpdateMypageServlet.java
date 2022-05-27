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
import javax.servlet.http.HttpSession;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/myPageUpdate.do")
/*@MultipartConfig(fileSizeThreshold = 1024*1024*3, maxFileSize=1024*1224*40, maxRequestSize=1024*1024*50)*/
public class UpdateMypageServlet extends HttpServlet {

   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      
      //1. 파라미터정보 가져오기
            String memId = req.getParameter("memId");
            
            //2.서비스 객체 가져오기
            MemberService memberService = MemberServiceImpl.getInstance();
            
            /*IAtchFileService fileService = AtchFileServiceImpl.getInstance();*/
            
            //3.회원정보 조회
            MemberVO mv = memberService.getMember(memId);
            
            /*if(mv.getAtchFileId() > 0) { //첨부파일이 존재하면...
               //첨부파일 정보 조회
                 AtchFileVO fileVO = new AtchFileVO();
                 fileVO.setAtchFileId(mv.getAtchFileId());
                 List<AtchFileVO> atchFileList = null;
                 try {
                 atchFileList = fileService.getAtchFileList(fileVO);
               } catch (Exception ex) {
                          ex.printStackTrace();
               }
                 req.setAttribute("atchFileList", atchFileList);
            }*/
             req.setAttribute("mv", mv);
            
              //4. 업데이트 화면으로 포워딩
                req.getRequestDispatcher("/WEB-INF/views/member/myPageUpdateForm.jsp").forward(req, resp);
   

   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            
      //1.요청 파라미터 정보 가져오기      

         String tempPassword = req.getParameter("memberPassword");
         String memberName = req.getParameter("memberName");
         String memberPhonenum = req.getParameter("memberPhonenum");
         String memberBirth = req.getParameter("memberBirth");
         String memberZipcode = req.getParameter("memberZipcode");
         String memberAddr1 = req.getParameter("memberAddr3");
         String memberAddr2 = req.getParameter("memberAddr4");
         String memberNickname = req.getParameter("memberNickName");
         String memberMail = req.getParameter("memberMail");
         
         
      String memberPassword = SHA256.encodeSha256(tempPassword);        
      
      //2.서비스 객체 생성하기
      MemberService memberService = MemberServiceImpl.getInstance();
      /*IAtchFileService fileService = AtchFileServiceImpl.getInstance();
      AtchFileVO atchFileVO = null;*/
      
      /*try{
      //첨부파일 목록 저장(공통기능)
      atchFileVO = fileService.saveAtchFileList(req);
      }catch (Exception e) {
           e.printStackTrace();
      }*/
       
      //3.회원정보  수정
      HttpSession session = req.getSession();
      MemberVO mv = new MemberVO();
      mv.setMemberId((String)req.getSession().getAttribute("memberId"));
      mv.setMemberPassword(memberPassword);
      mv.setMemberName(memberName);
      mv.setMemberPhonenum(memberPhonenum);
      mv.setMemberBirth(memberBirth);
      mv.setMemberZipcode(memberZipcode);
      mv.setMemberAddr1(memberAddr1);
      mv.setMemberAddr2(memberAddr2);
      mv.setMemberNickname(memberNickname);
      mv.setMemberMail(memberMail);
      
      /*if(atchFileVO ==null) {  //신규 첨부파일이 존재하지 않는 경우...
         mv.setAtchFileId(Long.parseLong(atchFileId));
      }else {
         mv.setAtchFileId(atchFileVO.getAtchFileId());
      }*/
   
      
      int cnt = memberService.updateMember(mv);
      
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
      req.getContextPath()+"/myPageDetail.do?msg="
                          +URLEncoder.encode(msg,"UTF-8");
      
      resp.sendRedirect(redirectUrl);//목록조회 화면으로 리다이렉트
             
}
}