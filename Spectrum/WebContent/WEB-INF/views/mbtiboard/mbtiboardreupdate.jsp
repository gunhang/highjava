<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%

	MbtiBoardVO mv = (MbtiBoardVO)request.getAttribute("mv");


%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="mbtiboardreupdate" method="post">
		<table class="table">
			<input type="hidden" name ="mbtiBoardPostnum" value="<%=mv.getmbtiboardPostnum()%>">		
			
			<tr>
			<td>내용: </td>
			<td><textarea name="boardContent" rows="5" cols="20"></textarea></td>
			<td><a href=""></a></td>
			
			</tr>
	
		
		</table>
		<input type="submit" value="게시글 수정">
	</form>
	


</body>
</html>