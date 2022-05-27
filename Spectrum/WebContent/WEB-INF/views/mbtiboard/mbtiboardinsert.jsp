<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String mbtiBoard=(String)request.getAttribute("mbtiBoard");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=mbtiBoard %> 게시글 등록</title>
<script src="../jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<style>
.textarea{
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
<form class="row g-3" action="/Spectrum/mbtiboard/mbtiboardinsert" method="post"enctype="multipart/form-data">
  <div class="col-md-6">
    <label for="mbtiboardTitle" class="form-label">제목</label>
    <input type="text" class="form-control" id="mbtiboardTitle" name ="mbtiboardTitle">
  </div>
  <div class="col-md-6">
	<label class="form-label" for="Typecode">말머리</label>
	<select name="Typecode" class="form-select" style="width: auto;">
	<option value="잡담">잡담</option> 
	<option value="팁">팁</option> 
	</select> 
  </div>
  <div class="mb-3">
  <label for="mbtiboardContent" class="form-label">내용</label>
  <textarea class="form-control" id="mbtiboardContent" name="mbtiboardContent" rows="10"></textarea>
</div>
<div class="input-group mb-3">
  <label class="input-group-text" for="atchFile">첨부파일</label>
  <input type="file" class="form-control" id="atchFile" name="atchFile">
</div>
  <div class="d-grid gap-2">
    <button type="submit" class="btn btn-lg btn-outline-success">게시글 등록</button>
  </div>
  <input type="hidden" name ="mbti" value="<%=mbtiBoard %>" >
<input type="hidden" name ="memberId" value="<%=session.getAttribute("memberId") %>" >
			
</form>

</body>
</html>