<<<<<<< HEAD
<%@page import="spectrum.anonymouseboard.AnonymouseBoardVO"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.mbtiboard.report.vo.MbtiBoardReportVO"%>
<%@page import="spectrum.mbtiboard.report.service.MbtiBoardReportService"%>
<%@page import="spectrum.mbtiboard.recommend.vo.MbtiBoardRecommendVO"%>
<%@page import="spectrum.mbtiboard.recommend.service.MbtiBoardRecommendService"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	AnonymouseBoardVO av = (AnonymouseBoardVO) request.getAttribute("av");
	String content=null;
	if(av.getAnonymouseboardContent()!=null){
		content=av.getAnonymouseboardContent().replace("\r\n","<br>");
	}
	String memId=(String)session.getAttribute("memberId");
	if(memId==null){
		memId="";
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스펙트럼</title>
<style>
/* #rebutton{
 width: 100px;
 height: 100px;

}
#report{

 width: 600px;
 height: 100px;

}
textarea{
	overflow-y: scroll;
} */

#detailPadding{
padding-top:100px;
}
.card{
	margin: 20%;
    margin-top: 0;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>
<body>

<div id="header">
	 <%@include file="/navbar.jsp" %>
</div>
<div id="detailPadding"></div>

<div class="card">
  <div class="card-header text-center">
   <small class="text-muted" style="display: grid;"><%=av.getAnonymouseboardType() %></small> <%=av.getAnonymouseboardTitle()%> 
  </div>
  <div class="card-body">
    <p class="card-text"><%=content%></p>
    <div class="row" style="justify-content: space-around; margin-inline: 25%;">
    <a href="anonylist" class="btn btn-secondary" style="width: auto;">목록</a>
    <%if(av.getMemberId().equals(memId)) {%>
	<a href="anonyupdate?postNum=<%=av.getAnonymouseboardPostnum()%>" class="btn btn-outline-danger" style="width: auto;">수정</a>
	<a href="anonydelete?postNum=<%=av.getAnonymouseboardPostnum()%>" class="btn btn-outline-danger" style="width: auto;">삭제</a>
	<% } %>
	</div>
  </div>
  <div class="card-footer text-muted">
    <%=av.getAnonymouseboardDate().substring(0, 16)%>
  </div>
</div>

	
</body>
</html>