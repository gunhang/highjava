<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   String alert = (String) request.getAttribute("alert");
%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/ff142f0d18.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
#carouselExampleControls{
      margin-left: 20%;
    margin-right: 20%;
    margin-top: 30px;
    margin-bottom: 30px;
} 

h2{
text-align: center;

}

h3{
text-align: center;

}



.wrap{
   width:500px;
   padding:250px 0px;
   box-sizing:border-box;
   margin:0 auto;
}

.mb-30{
   margin-bottom:30px;
}

.login-Btn{
   text-align:center;
}


.login-Btn a{
   margin:0px 10px;
}

.su-Btn{
   text-align:center;
}
.class{
       margin:0px 10px;
}

.form-control.login-ser{
   width:50%;
   margin:0 auto;
   margin-bottom:30px;
}

    </style>
  </head>

   <body>

<div id="wrap-container">


        <section id="contents_login">
          <!-- 로그인 메인 -->
       <div id="login_center"> 
            <form action="newPass.do" method="post">
      
            <h2>이메일로 새로운 비밀번호 전송하기</h2><br>
            <h3>아이디를 입력해 주세요</h3><br>
            
            <input type="text" class="form-control login-ser" name="memId" >

         


   
         
      <div class="su-Btn">
            <input class="btn btn-primary mb-30" type="submit"  value="새로운 비밀번호 발송" ><br><br>
      </div>
               
         </form>
          </div>
          
               <%
            if(alert != null) { 
               if(alert.equals("yes")) {
            %>   
               
               <script>
                  alert("이메일이 발송되었습니다.")
                  location.href='findPassword.jsp'
                  console.log(<%=alert%>)
               </script>
            <%      
               } else {
            %>
               <script>
                  alert("아이디가 없습니다.")
                  location.href='newPass.jsp'
                  console.log(<%=alert%>)
               </script>
            <%
               }
            }
            %>
          
        </section>


    </div>
  </body>
</html>