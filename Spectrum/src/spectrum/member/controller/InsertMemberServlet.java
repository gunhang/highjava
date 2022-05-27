package spectrum.member.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.member.service.MemberService;
import spectrum.member.service.MemberServiceImpl;
import spectrum.member.vo.MemberVO;

@WebServlet("/member/insert.do")
public class InsertMemberServlet extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.getRequestDispatcher("/WEB-INF/views/member/insertForm.jsp").forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      
      String memberId = req.getParameter("memberId");
      String memberName = req.getParameter("memberName");
      String tempPassword = req.getParameter("memberPassword");
      String memberBirth= req.getParameter("memberBirth1");
      String memberRegno = req.getParameter("memberRegno");
      String memberPhonenum = req.getParameter("memberPhonenum");
      String memberZipcode = req.getParameter("memberZipcode");
      String memberMail = req.getParameter("memberMail");
      String memberNickname = req.getParameter("memberNickName2");
      String memberAddr1 = req.getParameter("memberAddr1");
      String memberAddr2 = req.getParameter("memberAddr2");
      
      String memberPassword=SHA256.encodeSha256(tempPassword);
      
      
      
      MemberVO mv = new MemberVO();
      mv.setMemberId(memberId);
      mv.setMemberName(memberName);
      mv.setMemberPassword(memberPassword);
      mv.setMemberBirth(memberBirth);
      mv.setMemberRegno(memberRegno);
      mv.setMemberPhonenum(memberPhonenum);
      mv.setMemberZipcode(memberZipcode);
      mv.setMemberMail(memberMail);
      mv.setMemberNickname(memberNickname);
      mv.setMemberAddr1(memberAddr1);
      mv.setMemberAddr2(memberAddr2);
      
      MemberService memberService = MemberServiceImpl.getInstance();
      int cnt = memberService.insertMember(mv);
      
      String msg="";
      if(cnt>0) {
         msg= "성공";
         memberService.insertRank(mv);
      }else {
         msg = "실패";
      }
      
      req.setAttribute("msg", msg);
      

      //4. 목록 조회화면으로 이동
//      req.getRequestDispatcher("/member/list.do").forward(req, resp);
      
      String redirectUrl = "/Spectrum/main.jsp?msg="
                        +URLEncoder.encode(msg,"UTF-8");
      
      resp.sendRedirect(redirectUrl); //목록조회 화면으로 리다이렉트
   }
}