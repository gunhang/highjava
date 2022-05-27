<%@page import="spectrum.member.service.MemberServiceImpl"%>
<%@page import="spectrum.member.service.MemberService"%>
<%@page import="org.omg.CORBA.FREE_MEM"%>
<%@page import="spectrum.myspectrum.vo.FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<%
	
	
	String reqId=request.getParameter("requestId"); 
    String memberId=(String)session.getAttribute("memberId");
	FriendVO fv = new FriendVO();
	fv.setFriendRequestedId(reqId);
	fv.setFriendAppliedId(memberId);
	MemberServiceImpl.getInstance().insertFriends(fv);
	
    
    
	%>
		
		
	
	
</body>
</html>