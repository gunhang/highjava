
<%@page import="spectrum.rank.vo.RankVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RankVO rv = (RankVO) request.getAttribute("rv");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>이름:</td>
			<td><%=rv.getMemberId() %></td>
		</tr>
		<tr>
			<td>등급:</td>
			<td><%=rv.getRankMemrank() %></td>
		</tr>
	
		<tr>
			
			</tr>
		<tr>
			<td colspan="2">
				<a href="ranklist.do">[뒤로]</a>
				 <a href="rankupdate.do?memberId=<%=rv.getMemberId()%>">등급정보 수정</a>
			<%--	<a href="delete.do?memId=<%=mv.getMemId()%>">[회원정보 삭제]</a> --%>
			</td>
		</tr>
	</table>
</body>
</html>