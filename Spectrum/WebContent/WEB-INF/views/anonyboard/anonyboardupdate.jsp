<%@page import="spectrum.anonymouseboard.AnonymouseBoardVO"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	AnonymouseBoardVO av = (AnonymouseBoardVO)request.getAttribute("av");
	
/*  이거 잘못수정 */
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원 정보 변경</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<div id="header">
	 <%@include file="/navbar.jsp" %>
</div>


	<form action="anonyupdate" method="post">
		<table class="table">
			<input type="hidden" name ="anonyBoardPostnum" value="<%=av.getAnonymouseboardPostnum()%>">
			
			<tr>
			<td>제목:</td>
			<td><input type="text" name ="anonyBoardTitle" value=""></td>
			</tr>
			
			
	
			<tr>
			<td>내용: </td>
			<td><textarea name="boardContent" rows="5" cols="20"></textarea></td>
			</tr>
	
		
		</table>
		<button type="button" class="btn btn-link" type="submit" value="게시글 수정"></button>
	</form>
</body>
</html>