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
<title>Insert title here</title>
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
<div class="table-div">
<h1>관리자 상세 페이지</h1>
	<table class="table table-hover">
		<tr class="table-active">
			<td>아이디:</td>
			<td><%=av.getAdminId() %></td>
		</tr>
		<tr class="table-active">
			<td>별명:</td>
			<td><%=av.getAdminNickname() %></td>
		</tr>
		
		<tr class="table-active">
			<td>주민등록번호:</td>
			<td><%=av.getAdminRegno() %></td>
		</tr>
	
		<tr class="table-active">
			<td>전화번호:</td>
			<td><%=av.getAdminPhonenum() %></td>
		</tr>
	
		<tr class="table-active">
			<td>우편번호:</td>
			<td><%=av.getAdminZipcode() %></td>
		</tr>
	
		<tr class="table-active">
			<td>메일:</td>
			<td><%=av.getAdminMail() %></td>
		</tr>
	
		<tr class="table-active">
			<td>주소:</td>
			<td><%=av.getAdminAddr1() %></td>
		</tr>
	
		<tr class="table-active">
			<td>상세주소:</td>
			<td><%=av.getAdminAddr2() %></td>
		</tr>
	
		<tr class="table-active">
			<td colspan="2">
				<!-- <a href="adminlist.do">[이전]</a> -->
				<button type="button" class="btn btn-link"><a href="adminupdate.do?adminId=<%=av.getAdminId()%>">관리자정보 수정</a></button> 
			<button type="button" class="btn btn-link"><a href="admindelete.do?adminId=<%=av.getAdminId()%>">관리자정보 삭제</a></button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>