
<%@page import="spectrum.board.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<title>신고 삭제</title>
<style>
.table-div{
    padding: 20%;
    padding-top: 0;
    }
  .table > tbody {
    vertical-align: middle;
}
</style>
</head>
<body>


	<form action="<%=request.getContextPath()%>/report/boardReportDeleteUseId.do" method="post">
		<div class="table-div">
		
		<table class="table table-hover">
	
			<tr class="table-active">
				<td>삭제할 신고목록의 아이디:</td>
				<td><input type="text" class="form-control" id="inputEmail3" name="memberId" ></td>
			</tr>
		
			
		
		</table>
		<a href="reportlist.do">뒤로</a>
		<input type="submit" value="신고 삭제">
		</div>
	</form>
</body>
</html>