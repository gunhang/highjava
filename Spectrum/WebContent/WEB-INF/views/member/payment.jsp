<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<style>
   body,html{
   margin:0;
   padding:0;
   }

   .conBox{
      position:relative;
      width:100%;
      height:100vh;
   }
   
   
   .conBox .popCon{
      position: absolute;
      outline:2px dotted red;
       top: 50%;
       left: 50%;
       transform: translate(-50%, -50%);
       width: 600px;
   }
   
   .flex{
      display:flex;
   }
   
   .al-it-ce{
      align-items: center;
   }
   
   .her-Img{
      margin-right:60px;
   }
   
</style>
</head>

<body>


   <div class="conBox">
   
      <div class="popCon">
      <form class="flex al-it-ce">
         <div class="her-Img">
            <img src="<%=request.getContextPath() %>/imeges/heart.png" alt="My Image">
         </div>
         
         <div>
         <p>하트 10개 : 5000원</p>
         <button id="check_module" type="button">구매</button>
   
         <p>하트 15개 : 7500원</p>
         <button id="check_module2" type="button">구매</button>
         </div>
      </form>
      </div>
   
   </div>

   <script>
$("#check_module").click(function(){
   IMP.init('imp32878152');   //아임포트 관리자계정
   //결제 시스템을 실행시키는 함수
     IMP.request_pay({
      pay_method: 'card',
      name: '하트 10개',
      amount: '5000',   //테스트 완료 후 가격정보 넣기

      buyer_name:"<%=session.getAttribute("memberId")%>"
         }, function(rsp) {
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += rsp.buyer_name;
               msg += rsp.paid_amount;

               // 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
               // 결제내역을 사용자에게 보여주기 위해 필요함.
               $.ajax({
                  url : "/Spectrum/member/insertPayment.do",
                  type : "post",
                  data : {
                     "memberId" : "<%=session.getAttribute("memberId")%>",
                     "paymentAmount" : rsp.paid_amount
                  },
                  dataType : "json",
                  success : function(result) {
                     if (result == "1") {
                        alert(msg);

                     } else {
                        alert("디비입력실패");
                        return false;
                     }
                  },
                  error : function(a, b, c) {
                  }
               });
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
         });
      });
      
      
      
$("#check_module2").click(function(){
   IMP.init('imp32878152');   //아임포트 관리자계정
   //결제 시스템을 실행시키는 함수
     IMP.request_pay({
      pay_method: 'card',
      name: '하트 15개',
      amount: '7500',   //테스트 완료 후 가격정보 넣기

      buyer_name:"<%=session.getAttribute("memberId")%>"
         }, function(rsp) {
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += rsp.buyer_name;
               msg += rsp.paid_amount;

               // 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
               // 결제내역을 사용자에게 보여주기 위해 필요함.
               $.ajax({
                  url : "/Spectrum/member/insertPayment.do",
                  type : "post",
                  data : {
                     "memberId" : "<%=session.getAttribute("memberId")%>",
                     "paymentAmount" : rsp.paid_amount
                  },
                  dataType : "json",
                  success : function(result) {
                     if (result == "1") {
                        alert(msg);

                     } else {
                        alert("디비입력실패");
                        return false;
                     }
                  },
                  error : function(a, b, c) {
                  }
               });
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
         });
      });
      
      
      
   </script>



</body>
</html>