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
<title>등급정보 변경</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/rank/rankupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberId" value="<%=rv.getMemberId()%>">
		
		<table>
			<tr>
				<td>I D:</td>
				<td><%=rv.getMemberId()%></td>
			</tr>
			<tr>
				<td>등급:</td>
				<td><input type="text" name="rankMemrank" value="<%=rv.getRankMemrank()%>"></td>
			</tr>
	
			
		</table>
		<input type="submit" value="등급정보 수정">
	</form>
</body>
</html>