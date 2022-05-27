<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String mbtiBoard= (String)request.getAttribute("mbtiBoard");		
	String mbtiBoardNum= (String)request.getAttribute("mbtiBoardNum");	

%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.table textarea{
	overflow-y: scroll;
}
</style>
</head>

<body>

<form action="/Spectrum/mbtiboard/mbtiboardreinsert" method="post">
		<table class="table">
			
			
			<input type="hidden" name ="mbti" value="<%=mbtiBoard%>" >
			<input type="hidden" name ="mbtiBoardNum" value="<%=mbtiBoardNum%>" >
			
			
			<tr>
			<td>저자: </td>
			<td><input type="text" name ="memberId" value="HYUNAH"></td>
			</tr>
			<tr>
	
			<tr>
			<td>내용: </td>
			<td><textarea name="mbtiboardContent" rows="10" cols="100"></textarea></td>
			</tr>
		
		</table>
		<input type="submit" value="게시글 등록">
	</form>
</body>
</html>