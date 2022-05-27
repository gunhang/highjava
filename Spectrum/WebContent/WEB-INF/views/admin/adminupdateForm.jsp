<%@page import="spectrum.admin.vo.AdminVO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	AdminVO av = (AdminVO) request.getAttribute("av");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<title>관리자정보 변경</title>
<style>
.table-div{
    padding: 20%;
    padding-top: 0;
    }
  .table > tbody {
    vertical-align: middle;
}
h1 {
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/admin/adminupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="adminId" value="<%=av.getAdminId()%>">
		<div class="table-div">
		<h1>관리자 수정</h1>
		<table class="table table-hover">
			<tr class="table-active">
				<td>I D:</td>
				<td><%=av.getAdminId()%></td>
			</tr>
		
			<tr class="table-active">
				<td>비밀번호:</td>
				<td><input type="text" name="adminPassword" class="form-control" id="inputEmail3" value="<%=av.getAdminPassword()%>"></td>
			</tr>
			<tr class="table-active">
				<td>별명:</td>
				<td><input type="text" name="adminNickname" class="form-control" id="inputEmail3" value="<%=av.getAdminNickname()%>"></td>
			</tr>
			<tr class="table-active">
				<td>전화번호:</td>
				<td><input type="text" name="adminPhonenum" class="form-control" id="inputEmail3" value="<%=av.getAdminPhonenum()%>"></td>
			</tr>
			<tr class="table-active">
				<td>우편번호:</td>
				<td><input type="text" name="adminZipcode" class="form-control" id="inputEmail3" value="<%=av.getAdminZipcode()%>"></td>
			</tr>
			<tr class="table-active">
				<td>주소:</td>
				<td><textarea name="adminAddr1" class="form-control" id="exampleTextarea" rows="2" cols="20"><%=av.getAdminAddr1()%></textarea></td>
			</tr>
			<tr class="table-active">
				<td>상세주소:</td>
				<td><textarea name="adminAddr2" class="form-control" id="exampleTextarea" rows="2" cols="20"><%=av.getAdminAddr2()%></textarea></td>
			</tr>
			<tr class="table-active">
				<td>메일:</td>
				<td><input type="text" name="adminZipcode" class="form-control" id="inputEmail3"  value="<%=av.getAdminMail()%>"></td>
				
			</tr>
			
		
	
		</table>
		<button type="button" class="btn btn-link"><a href="admindetail.do?adminId=<%=av.getAdminId()%>">이전</a></button>
		<input type="submit" value="관리자정보 수정">
		</div>
	</form>
</body>
</html>