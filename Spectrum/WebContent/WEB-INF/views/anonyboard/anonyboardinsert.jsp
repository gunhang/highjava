<%@page import="spectrum.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MemberVO mv=(MemberVO)session.getAttribute("mv");	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>익명 게시글 등록</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<style>
textarea{
	overflow-y: scroll;
}
form{
padding: 20%;
    padding-top: 0;
}
</style>
</head>

<body>

<div id="header">
	 <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>
<form class="row g-3" action="/Spectrum/anonyboard/anonyboardinsert" method="post">
  <div class="col-md-6">
    <label for="anonyboardTitle" class="form-label">제목</label>
    <input type="text" class="form-control" id="anonyboardTitle" name ="anonyboardTitle">
  </div>
  <div class="col-md-6">
	<label class="form-label" for="Typecode">말머리</label>
	<select name="Typecode" class="form-select" style="width: auto;">
	<option value="잡담">잡담</option> 
	<option value="팁">팁</option> 
	</select> 
  </div>
  <div class="mb-3">
  <label for="anonyboardContent" class="form-label">내용</label>
  <textarea class="form-control" id="anonyboardContent" name="anonyboardContent" rows="10"></textarea>
</div>
  <div class="d-grid gap-2">
    <button type="submit" class="btn btn-lg btn-outline-success">게시글 등록</button>
  </div>
<input type="hidden" name ="memberId" value="<%=mv.getMemberId() %>" >			
</form>

</body>
</html>