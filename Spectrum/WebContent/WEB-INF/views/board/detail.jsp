<%@page import="spectrum.board.vo.NoticeBoardVO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeBoardVO bv = (NoticeBoardVO) request.getAttribute("bv");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<title>Insert title here</title>
<style>
#rebutton{
 width: 100px;
 height: 100px;

}
#report{

 width: 600px;
 height: 100px;

}
.table textarea{
	overflow-y: scroll;
}
#mbtiBoardDetail{
	padding-left: 10%;
	padding-right: 10%;

}
#boardDetailContent{
	height: 150px;
}
#detailPadding{

padding-top:5%;

}

</style>
</head>
<body>
<body>

<div id="header">
	 <%@include file="/navbar.jsp" %>
</div>


<div id="detailPadding"></div>
<div id="mbtiBoardDetail"></div>
	<table class="table">
		<tr>
			<td>말머리:</td>
			<td><%=bv.getNoticeboardType() %></td>
		</tr>
		<tr>
			<td>글번호:</td>
			<td><%=bv.getNoticeboardNum() %></td>
		</tr>
		<tr>
			<td>글제목:</td>
			<td><%=bv.getNoticeboardTitle() %></td>
		</tr>
		<tr>
			<td>작성날짜:</td>
			<td><%=bv.getNoticeboardDate() %></td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td><%=bv.getAdminId() %></td>
		</tr>
		<tr id="boardDetailContent">
			<td>글내용:</td>
			<td><%=bv.getNoticeboardContent() %></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="list.do">목록</a>
				<a href="update.do?noticeboardNum=<%=bv.getNoticeboardNum()%>">게시글 수정</a>
				<a href="delete.do?noticeboardNum=<%=bv.getNoticeboardNum()%>">게시글 삭제</a> 
			</td>
		</tr>
	</table>
</body>
</html>