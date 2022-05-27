
<%@page import="spectrum.myatc.vo.MyAtcVO"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberVO mv = (MemberVO) request.getAttribute("mv");
						int atcId =(Integer)(request.getAttribute("atcId"));
	List<MyAtcVO> atchFileList = 
			(List<MyAtcVO>) request.getAttribute("atchFileList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<form action="<%=request.getContextPath()%>/member/atcupdate.do" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="atchFileId" value="<%=atcId%>">
		<table>
			
	
			<tr>
				<td>새로운 첨부파일</td>	
				<td><button type="button" class="btn btn-secondary"><input type="file" name="myatc"></button></td>
			</tr>	
		</table>
		<input type="submit" value="회원프로필 수정">
	</form>
</body>
</html>