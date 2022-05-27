

<%@page import="spectrum.board.vo.QuestionBoardVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	QuestionBoardVO qbv = (QuestionBoardVO) request.getAttribute("qbv");
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<title>게시글 수정</title>
<style>
textarea{
   overflow-y: scroll;
}
form{
padding: 20%;
    padding-top: 0;
}
</style>
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>
	<form action="<%=request.getContextPath()%>/board/questionupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="questionboardNumber" value="<%=qbv.getQuestionboardNumber()%>">
		<div class="col-md-6">
    <label for="questionboardTitle" class="form-label">글번호</label>
		<%=qbv.getQuestionboardNumber()%>
			  </div>
		<%-- <table>
			<tr>
				<td>글번호:</td>
				<td><%=qbv.getQuestionboardNumber()%></td>
			</tr> --%>
					<div class="col-md-6">
    <label for="questionboardTitle" class="form-label">작성자</label>
 <%=qbv.getMemberId()%>
			  </div>
			
			
			<%-- <tr>
				<td>작성자:</td>
				<td><%=qbv.getMemberId()%></td>
			</tr> --%>
			  <div class="col-md-6">
    <label for="noticeboardTitle" class="form-label">글제목</label>
    <input type="text" class="form-control" id="questionboardTitle" name="questionboardTitle">
			  </div>
			<%-- <tr>
				<td>글제목:</td>
				<td><input type="text" name="questionboardTitle" value="<%=qbv.getQuestionboardTitle()%>"></td>
			</tr> --%>
			  <div class="col-md-6">
    <label for="noticeboardTitle" class="form-label">글내용</label>
    <input type="text" class="form-control" id="questionboardContent" name="questionboardContent">
			  </div>
			<%-- <tr>
				<td>글내용:</td>
				<td><input type="text" name="questionboardContent" value="<%=qbv.getQuestionboardContent()%>"></td>
			</tr> --%>
			
		
	
		<input type="submit" value="게시글 수정">
	</form>
</body>
</html>