<%@page import="spectrum.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.su-Btn button{
	
}
  
</style>
	
<div>
    <%@include file="/navbar.jsp" %>
</div>
</head>
<body>


	<div class="wrap">
		<div style="padding-bottom: 18px;">
		<h2>회원 로그인 </h2>
		</div>
	<form action="memberjoin.do" method="post">
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">ID</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputEmail3"
					name="memberId">
			</div>
		</div>
		<div class="row mb-3">
			<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="inputPassword3"
					name="memberPassword">
			</div>
		</div>

		<div class="su-Btn">
			<button type="submit" class="btn btn-primary mb-30">Sign in</button>
		</div>

	</form>
	
	
	<%
		MemberVO mv = (MemberVO) request.getAttribute("mv");

		if (mv != null) {
	%>
	<script>
	alert("아이디는 : "+"<%=mv.getMemberId()%>" + " 입니다.")
	</script>


	<%
		}
	%>





	<div class="login-Btn">
		<a href="/Spectrum/adminlogin/adminjoin.do" style="text-decoration:none">관리자 로그인</a>
		<a href="/Spectrum/member/findmember.do" style="text-decoration:none">아이디 찾기</a>
		<a class="nav-link" href="/Spectrum/newPass.do"
          onclick="window.open(this.href, '_blank', 'width=600, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;">비밀번호 찾기</a>
		

	</div>

	</div>


</body>
</html>