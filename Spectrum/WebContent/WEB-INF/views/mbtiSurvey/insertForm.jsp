<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MBTI 검사 문항 등록</title>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div>
    <%@include file="/navbar.jsp" %>
</div>
<div id="detailPadding" style="padding-top: 100px"></div>
	<form action="insert.do" method="post" class="form-group">
		
		<table class="table">
			<tr>
				<td>내용 :</td>
				<td><textarea name="mbtiSurveyContent" rows="5" cols="40" class="form-control"></textarea></td>
			</tr>
			<tr>
				<td>문항 타입 :</td>
				<td><input type="text" name="mbtiSurveyType" value="" class="form-control"></td>
			</tr>
			<tr>
				<td>추가 검사 문항 여부(Y/N) :</td>
				<td><input type="text" name="mbtiSurveyAddyn" value="" class="form-control"></td>
			</tr>
		</table>
		<input type="submit" value="검사문항 등록" class="btn btn-primary">
		
	</form>
</body>
</html>