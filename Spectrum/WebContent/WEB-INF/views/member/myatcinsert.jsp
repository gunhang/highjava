<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId= (String)session.getAttribute("memberId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-3.6.0.min.js"></script>
<title>프로필사진 등록</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<script>
$('#insert').click(function() {
	location.reload();
	});
</script>
</head>
<body>
	<form action="myatcinsert.do" method="post" enctype="multipart/form-data">
		
		<table>
		
			<tr>
				<td>첨부파일 :</td>
				<td><input type="file" name="myatc"></td>
			</tr>
			
		</table>
		<input type="submit" value="프로필사진등록" id="insert">
	</form>
</body>
</html>