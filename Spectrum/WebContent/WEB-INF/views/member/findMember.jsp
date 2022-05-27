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
<div>
    <%@include file="/navbar.jsp" %>
</div>
   <div class="wrap">
      <div style="padding-bottom: 18px;">
      <h2>아이디 찾기 </h2>
      </div>
   <form action="findmember.do" method="post">
      <div class="row mb-3">
         <label for="inputEmail3" class="col-sm-2 col-form-label">이  름</label>
         <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail3"
               name="memberName" placeholder="이름을 입력하세요.">
         </div>
      </div>
      <div class="row mb-7">
         <label for="inputPassword3" class="col-sm-2 col-form-label">주민번호 </label>
         <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3"
               name="memberRegno" placeholder=" 주민번호 뒷 7자">
         </div>
      </div>
      
      
      
      
      
      <div class="su-Btn">
         <button type="submit" class="btn btn-primary mb-30">아이디 찾기</button>
         <a href="/Spectrum/member/memberjoin.do" class="btn btn-primary mb-30">뒤로가기</a>         
      </div>



   </form>
   </div>
</body>
</html>