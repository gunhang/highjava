<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MemberVO> memList = (List<MemberVO>) request.getAttribute("memList");

	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>첨부파일 ID</th>


		</tr>

		<%
			int memSize = memList.size();
			if (memSize > 0) {
				for (int i = 0; i < memSize; i++) {
		%>
		<tr>
			<td><%=memList.get(i).getMemberId()%></td>
			<td><a href="detail.do?memId=<%=memList.get(i).getMemberId()%>"><%=memList.get(i).getMemberName()%></a></td>
<%-- 			<td><%=memList.get(i).getMemTel()%></td>
			<td><%=memList.get(i).getMemAddr()%></td>
			<td><%=memList.get(i).getAtchFileId()%></td> --%>

		</tr>

		<%
			}
			} else {
		%>
		<tr>
			<td colspan="4">회원 정보가 없습니다.</td>
		</tr>
		<%
			}
		%>
	</table>

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