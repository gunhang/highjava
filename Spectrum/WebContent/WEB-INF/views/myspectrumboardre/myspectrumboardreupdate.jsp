<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%

	SpectrumBoardVO sbv = (SpectrumBoardVO)request.getAttribute("sbv");


%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="mbtiboardreupdate" method="post">
		<table class="table">
			<input type="hidden" name ="boardPostnum" value="<%=sbv.getSpecbrdSrlnmbr()%>">		
			
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