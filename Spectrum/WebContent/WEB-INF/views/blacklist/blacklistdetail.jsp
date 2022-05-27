
<%@page import="spectrum.blacklist.vo.BlacklistVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BlacklistVO bv = (BlacklistVO) request.getAttribute("bv");
	
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
	margin-top: 30px;

}
</style>
</head>
<body>
<div class="table-div">
<h1>블랙리스트 상세 조회</h1>

	<table class="table table-hover">
		<tr class="table-active">
			<td scope="col">블랙리스트 번호:</td>
			<td scope="col"><%=bv.getBlacklistNumber() %></td>
		</tr>
		<tr class="table-active">
			<td scope="col">아이디:</td>
			<td scope="col"><%=bv.getMemberId() %></td>
		</tr>
		<tr class="table-active">
			<td scope="col">블랙리스트 유무:</td>
			<td scope="col"><%=bv.getBlacklistBlackyn() %></td>
		</tr>
		<tr class="table-active">
			<td scope="col">블랙리스트 등록 날짜:</td>
			<td scope="col"><%=bv.getBlacklistRgstrdate() %></td>
		</tr>
		<tr class="table-active">
			<td scope="col">블랙리스트 풀리는 날짜:</td>
			<td scope="col"><%=bv.getBlacklistReleasedate() %></td>
		</tr>
		<tr class="table-active">
			<td scope="col">블랙리스트 사유:</td>
			<td scope="col"><%=bv.getBlacklistReason() %></td>
		</tr>

		<tr class="table-active">
			<td colspan="2">
				<a href="blacklistlist.do">이전</a>
			<%-- 	<a href="update.do?memId=<%=mv.getMemId()%>">[회원정보 수정]</a> --%>
				<a href="blacklistdelete.do?blacklistNumber=<%=bv.getBlacklistNumber()%>">블랙리스트 풀기</a> 
			</td>
		</tr>
	</table>
	</div>
</body>
</html>