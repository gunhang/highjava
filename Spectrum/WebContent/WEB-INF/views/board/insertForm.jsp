
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
</head>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		
		<table>
			
			<tr>
				<td>글 작성자:</td>
				<td><input type="text" name="adminId" value=""></td>
			</tr>
			<tr>
				<td>글 제목:</td>
				<td><input type="text" name="noticeboardTitle" value=""></td>
			</tr>
			
			<tr>
				<td>말머리:</td>
				<td><input type="text" name="noticeboardType" value=""></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><input type="text" name="noticeboardContent"></td>
			</tr>
			
		</table>
		<input type="submit" value="회원등록">
		
		
	</form>
</body>
</html>