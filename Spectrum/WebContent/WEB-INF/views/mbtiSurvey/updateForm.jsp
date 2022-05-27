<%@page import="spectrum.mbtiSurvey.vo.MbtiSurveyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MbtiSurveyVO vo = (MbtiSurveyVO) request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MBTI 검사 문항 수정</title>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div>
    <%@include file="/navbar.jsp" %>
</div>
   <form action="<%=request.getContextPath()%>/mbtiSurvey/update.do" method="post">
   	 <fieldset>
   		 <legend><%=vo.getMbtiSurveyNumber()%> 문항 수정</legend>
		<div class="form-group">
				<label for="mbtiSurveyNumber" class="form-label mt-4">문항 번호</label>
				<input type="text" id="mbtiSurveyNumber" name="mbtiSurveyNumber" value="<%=vo.getMbtiSurveyNumber()%>" class="form-control">
		</div>
		<div class="form-group">
				<label for="exampleTextarea" class="form-label mt-4">내용</label>
				<textarea name="mbtiSurveyContent" class="form-control" id="exampleTextarea" rows="3"><%=vo.getMbtiSurveyContent()%></textarea>
		</div>
		<div class="form-group">
				<label for="mbtiSurveyType" class="form-label mt-4">문항 타입</label>
				<input type="text"  id="mbtiSurveyType" name="mbtiSurveyType" value="<%=vo.getMbtiSurveyType()%>" class="form-control">
		</div>
		<div class="form-group">
				<label for="mbtiSurveyAddyn" class="form-label mt-4">추가 검사 문항 여부(Y/N)</label>
				<input type="text" id="mbtiSurveyAddyn" name="mbtiSurveyAddyn" value="<%=vo.getMbtiSurveyAddyn()%>" class="form-control">
		</div>
		<input type="submit" value="회원정보수정" class="btn btn-primary">
		</fieldset>
	</form>
</body>
</html>