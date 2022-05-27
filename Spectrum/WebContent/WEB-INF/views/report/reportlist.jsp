
<%@page import="spctrum.report.vo.ReportVO"%>
<%@page import="spectrum.board.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<ReportVO> reportUserList =
					(List<ReportVO>) request.getAttribute("reportUserList");	
	List<ReportVO> reportBoardList =
					(List<ReportVO>) request.getAttribute("reportBoardList");	

	String msg = request.getParameter("msg") == null
			? "" :request.getParameter("msg");
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>신고 종합 조회</title>
<style>
.table-div{
    padding: 20%;
    padding-top: 3%;
    }
  .table > tbody {
    vertical-align: middle;
}
h1 {
 align-content: center;	
}
</style>
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>
<div class="table-div">
<h1>게시글 신고 종합 조회</h1>

<table class="table table-hover">
	<tr class="table-active">
		<th scope="col">게시글 신고번호</th>
		<th scope="col">신고당한 게시글 번호</th>
		<th scope="col">신고당한 날짜</th>
		<th scope="col">게시판 구분</th>
		<th scope="col">게시글 작성자</th>
		<th scope="col">신고사유</th>
		<th scope="col">삭제</th>
		
	</tr>
	<%
		int reportBoardSize = reportBoardList.size();
		if(reportBoardSize > 0) {
			for(int i=0; i < reportBoardSize; i++){
				
		if(reportBoardList.get(i).getMbtiboardPostnum().equals("-1")){
	%>
	<tr class="table-active">
		<td scope="col"><%=reportBoardList.get(i).getBoardreportNumber() %></td>
		<td scope="col"><%=reportBoardList.get(i).getAnonymousboardPostnum() %></td>
		<td scope="col"><%=reportBoardList.get(i).getBoardreportDate() %></td>
		<td scope="col"><%=reportBoardList.get(i).getBoardClassificationCode() %></td>
		<td scope="col"><%=reportBoardList.get(i).getMemberId() %></td>
		<td scope="col"><%=reportBoardList.get(i).getBoardreportReason() %></td>
		<td scope="col"><a href="boardReportDelete.do?boardreportNumber=<%=reportBoardList.get(i).getBoardreportNumber()%>">[삭제]</a></td>
		
	</tr>
	<%
		}else if(reportBoardList.get(i).getAnonymousboardPostnum().equals("-1")){
	%>		
		<tr class="table-active">
		<td scope="col"><%=reportBoardList.get(i).getBoardreportNumber() %></td>
		<td scope="col"><%=reportBoardList.get(i).getMbtiboardPostnum() %></td>
		<td scope="col"><%=reportBoardList.get(i).getBoardreportDate() %></td>
		<td scope="col"><%=reportBoardList.get(i).getBoardClassificationCode() %></td>
		<td scope="col"><%=reportBoardList.get(i).getMemberId() %></td>
		<td scope="col"><%=reportBoardList.get(i).getBoardreportReason() %></td>
		<td scope="col"><a href="boardReportDelete.do?boardreportNumber=<%=reportBoardList.get(i).getBoardreportNumber()%>">[삭제]</a></td>
	</tr>	
	<%		
		}
	}}else{
	%>
	<tr class="table-active">
		<td colspan="4">신고 정보가 없습니다.</td>
	</tr>
	<% 
	}
	
	%>
</table>
<h1>유저 신고 종합 조회</h1>
<table class="table table-hover">
	<tr class="table-active">
		<th scope="col">유저 신고 번호</th>
		<th scope="col">신고한 아이디</th>
		<th scope="col">신고당한 아이디</th>
		<th scope="col">신고당한 날짜</th>
		<th scope="col">신고사유</th>
		<th scope="col">삭제</th>
		
		
	</tr>
	<%
		int reportUserSize = reportUserList.size();
		if(reportUserSize > 0) {
			for(int j=0; j < reportUserSize; j++){
				
		
	%>
	<tr class="table-active">
		<td scope="col"><%=reportUserList.get(j).getMemberReportNum() %></td>
		<td scope="col"><%=reportUserList.get(j).getMemberReportId() %></td>
		<td scope="col"><%=reportUserList.get(j).getMemberReportedId() %></td>
		<td scope="col"><%=reportUserList.get(j).getMemberReportDate() %></td>
		<td scope="col"><%=reportUserList.get(j).getMemberReportReason() %></td>
		<td scope="col"><a href="userReportDelete.do?memberReportNum=<%=reportUserList.get(j).getMemberReportNum() %>">[삭제]</a></td>
	</tr>
	<%
		}
	}else{
	%>
	<tr>
		<td colspan="4">신고 정보가 없습니다.</td>
	</tr>
	<% 
	}
	%>
</table>

<%
	if(msg.equals("성공")){
%>
	<script>
		alert("정상적으로 처리되었습니다.");
	</script>
<%		
	}
%>
<div>
<a class="nav-link" href="boardReportDeleteUseId.do"
          onclick="window.open(this.href, '_blank', 'width=800, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;">유저가 받은 모든 게시글 신고 초기화</a>
<a class="nav-link" href="userReportDeleteUseId.do"
          onclick="window.open(this.href, '_blank', 'width=800, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;">유저가 받은 모든 유저 신고 초기화</a>
<!-- <a href="boardReportDeleteUseId.do">[유저가 받은 모든 게시글 신고 초기화]</a> -->
<!--  <a href="userReportDeleteUseId.do">[유저가 받은 모든 유저 신고 초기화]</a> -->
</div>
</div>
</body>
</html>