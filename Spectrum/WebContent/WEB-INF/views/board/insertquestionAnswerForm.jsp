<%@page import="spectrum.board.vo.QuestionBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardNo = (String) request.getParameter("questionboardNumber");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<style>
textarea{
   overflow-y: scroll;
}
form{
padding: 20%;
    padding-top: 0;
}
</style>
<title>답변 등록</title>
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>
	<form action="questionAnswerinsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="questionboardNum" value="<%=boardNo%>">
		<input type="hidden" name="adminId" value="<%=session.getAttribute("adminId")%>">
		
		
			<div class="col-md-6">
    <label for="questionboardTitle" class="form-label">작성자</label>
    <%=session.getAttribute("adminId")%>
			  </div>
		
			<%-- <tr>
				<td>작성자</td>
				<td><%=session.getAttribute("adminId")%></td>
			</tr> --%>
			
				<div class="col-md-6">
    <label for="qstn_ansbrdCn" class="form-label">제목</label>
    <input type="text" class="form-control" id="qstn_ansbrdCn" name="questionboardTitle">
			  </div>
			<!-- 
			<tr>
				<td>댓글내용</td>
				<td><input type="text" name="qstn_ansbrdCn"></td>
			</tr> -->
			
		
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>