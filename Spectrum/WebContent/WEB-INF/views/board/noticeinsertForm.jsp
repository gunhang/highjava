<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>공지사항 등록</title>
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>
<div id="detailPadding" style="padding-top: 100px"></div>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="adminId" value="<%=session.getAttribute("adminId")%>">
	
			  <div class="col-md-6">
    <label for="noticeboardTitle" class="form-label">제목</label>
    <input type="text" class="form-control" id="anonyboardTitle" name="noticeboardTitle">
			  </div>
		
			<!-- <tr>
				<td>글 제목:</td>
				<td><input type="text" name="noticeboardTitle" value=""></td>
			</tr>
			 -->
			   <div class="col-md-6">
   				<label class="form-label" for="Typecode">말머리</label>
   				<select name="noticeboardType" class="form-select" style="width: auto;">
   					<option value="공지사항">공지사항</option> 
   					<option value="자주묻는질문">자주묻는질문</option> 
   					</select> 
  					</div>
			 
		<!-- 	<tr>
				<td>말머리:</td>
				<td><input type="text" name="noticeboardType" value=""></td>
			</tr> -->
			
			 <div class="mb-3">
  			<label for="anonyboardContent" class="form-label">글내용</label>
  			<textarea class="form-control" id="anonyboardContent" name="noticeboardContent" rows="10"></textarea>
				</div>
			
			<!-- <tr>
				<td>글내용</td>
				<td><input type="text" name="noticeboardContent"></td>
			</tr> -->
			
		
		<input type="submit" value="회원등록">
	</form>
</body>
</html>