<%@page import="spectrum.mbtiSurvey.vo.MbtiSurveyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

 	List<MbtiSurveyVO> surveyList = (List<MbtiSurveyVO>) request.getAttribute("surveyList");
	String msg = request.getParameter("msg")==null?"":request.getParameter("msg");

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MBTI 검사 문항 목록</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<style>
h1{
margin-top: 0;
margin-bottom: 0;
padding: 1.2rem;
}
header {
	display: flex;
	align-items: center;
    justify-content: center;
    padding: 1.2rem;
    top: 40px;
    position: relative;
}
th, td{
font-size: 1.2rem;
}
table{
top: 20px;
    position: relative;
}
.table-div{
    padding: 20%;
    padding-top: 0;
    }
  .table > tbody {
    vertical-align: middle;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>
<div>
    <%@include file="/navbar.jsp" %>
</div>
<div></div>
	<header>
		<h1>MBTI 검사 문항 목록</h1>
		<a href="insert.do" class="btn btn-success">문항 등록</a>
	</header>
	<div class="table-div">
	<table border="1" class="table table-hover">
		<tr class="table-active">
			<th scope="col">문항 번호</th>
			<th scope="col">내용</th>
			<th scope="col">문항 타입</th>
			<th scope="col">추가 검사 문항 여부</th>
			<th scope="col">수정</th>
			<th scope="col">삭제</th>
			
		</tr>
		<%
		 int surveyListSize = surveyList.size();
		if(surveyListSize > 0){
			for(int i=0; i<surveyListSize; i++){
		%>
		<tr class="table-active">
			<td><%= surveyList.get(i).getMbtiSurveyNumber() %></td>
			<td><%= surveyList.get(i).getMbtiSurveyContent() %></td>
			<td><%= surveyList.get(i).getMbtiSurveyType() %></td>
			<td><%= surveyList.get(i).getMbtiSurveyAddyn() %></td>
			<td><a href="update.do?mbtiSurveyNumber=<%=surveyList.get(i).getMbtiSurveyNumber()%>" class="btn btn-outline-warning">수정</a></td>
			<td><a href="delete.do?mbtiSurveyNumber=<%=surveyList.get(i).getMbtiSurveyNumber()%>" class="btn btn-outline-danger">삭제</a></td>
		</tr>
		<%
			}
		}else{
		%>
		<tr>
			<td colspan="4">검사 문항 정보가 없습니다.</td>
		</tr>
		<%
		}
		%>
	</table>
	</div>
	
	
	<%
	  if(msg.equals("성공")){
	%>
	<script>
		alert('정상적으로 처리되었습니다.');
	</script>
	<%
	  }
	%>
</body>
</html>