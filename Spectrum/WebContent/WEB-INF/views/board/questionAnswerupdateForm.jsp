

<%@page import="spectrum.board.vo.QuestionAnswerBoardVO"%>
<%@page import="spectrum.board.vo.QuestionBoardVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	QuestionAnswerBoardVO qabv = (QuestionAnswerBoardVO) request.getAttribute("qabv");
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<title>답변 수정</title>
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
	<form action="<%=request.getContextPath()%>/board/questionAnswerupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="questionboardNum" value="<%=qabv.getQuestionboardNum()%>">
		<%=qabv.getQuestionboardNum()%>
	
		 <div class="mb-3">
  			<label for="anonyboardContent" class="form-label">글내용</label>
  			<textarea class="form-control" id="anonyboardContent" name="qstn_ansbrdCn" rows="10"></textarea>
				</div>
		<%-- 
			<tr>
				<td>글내용:</td>
				<td><input type="text" name="qstn_ansbrdCn" value="<%=qabv.getQstn_ansbrdCn()%>"></td>
			</tr> --%>
			
		

		<input type="submit" value="답변 수정">
	</form>
</body>
</html>