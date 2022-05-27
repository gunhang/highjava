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
<body>


<%
		MemberReportVO reportVO= new MemberReportVO();
		reportVO.setMemberReportedId("reportId");
		reportVO.setMemberReportId((String)session.getAttribute("memberId"));
		
		
		
		String reportCheck=MemberReportService.getInstance().reportCheck(reportVO);
		if(reportCheck==null){
				
		}
		
	%>
	<div id="report">
	<form action="myreportinsert" method="post">
	<input type="hidden" value="HYUNAH" name="reportedId">
	<input type="hidden" value="<%=reportVO.getMemberReportId()%>" name="reportId"> 
	<textarea rows="2" cols="100" name="textarea"></textarea>
	
	<button type="submit" class="btn btn-primary position-relative">유저신고</button>
	</form>
	</div>



</body>
</html>