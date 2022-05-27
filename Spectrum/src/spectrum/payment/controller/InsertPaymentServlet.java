package spectrum.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.payment.service.PaymentService;
import spectrum.payment.vo.PaymentVO;
import spectrum.rank.service.IRankService;
import spectrum.rank.service.RankServiceImpl;
import spectrum.rank.vo.RankVO;


@WebServlet("/member/insertPayment.do")
public class InsertPaymentServlet extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.getRequestDispatcher("/WEB-INF/views/member/payment.jsp").forward(req, resp);
      
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      // 1. ajax로 부터 받아온 parameter 저장
      String memberId = req.getParameter("memberId");
      String paymentAmount = req.getParameter("paymentAmount");

      // 2.서비스객체 가져오기
      PaymentService paymentService = PaymentService.getInstance();
      PaymentVO pv = new PaymentVO();
      
      pv.setMemberId(memberId);
      pv.setPaymentAmount(paymentAmount);
   
        int cnt = paymentService.checkPayment(pv);
      
      if(cnt>0) {
         paymentService.insertPayment(pv);
         
         }else {
         paymentService.insertFirstPayment(pv);
      }
      

      //(등급 업데이트 자동화시스템) - 머지할때 보세요!
      IRankService rankService = RankServiceImpl.getInstance();
      List<RankVO> rankList = rankService.getALLMemberWhiteList();
      rankList = rankService.getALLMemberWhiteList();
      int size = rankList.size();
      if (size > 0) {
         for (int m = 0; m < size; m++) {
               memberId = rankList.get(m).getMemberId();
            String payment = rankService.getTotalPayment(memberId);
            if (payment != null) {

               int totalPayment = Integer.valueOf(rankService.getTotalPayment(memberId));
               if (50000 <= totalPayment && totalPayment < 89000) {
                  rankService.updateRankYellow(memberId);
               } else if (89000 <= totalPayment && totalPayment < 500000) {
                  rankService.updateRankPurple(memberId);
               } else if (500000 <= totalPayment) {
                  rankService.updateRankRainbow(memberId);
               }
            }

         }
      }

      paymentService.updateHeart(pv);
      
      //4. 목록 조회화면으로 이동
         req.getRequestDispatcher("/Spectrum/login.jsp").forward(req, resp);
   }
}