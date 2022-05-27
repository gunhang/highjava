<%@page import="spectrum.myspectrum.report.service.MemberReportService"%>
<%@page import="spectrum.myspectrum.report.vo.MemberReportVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<body>

<%
		

		String reportId =request.getParameter("reportId");
		String postNum = request.getParameter("postNum");		

		MemberReportVO reportVO= new MemberReportVO();
		reportVO.setMemberReportedId(reportId);
		reportVO.setMemberReportId((String)session.getAttribute("memberId"));
		
		
		
		String reportCheck=MemberReportService.getInstance().reportCheck(reportVO);
		if(reportCheck==null){
				
		}
		
	%>
	<div id="report">
	<form action="memberreport/myreportinsert" method="post">
	<input type="hidden" value=<%=reportId%> name="reportedId">
	<input type="hidden" value="<%=reportVO.getMemberReportId()%>" name="reportId">
	<input type="hidden" value="<%=postNum%>"name="postNum">  
	<textarea rows="2" cols="100" name="textarea"></textarea>
	
	<button type="submit" class="btn btn-primary position-relative">유저신고</button>
	</form>
	</div>

<%

%>

</body>
</html>