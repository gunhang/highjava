<%@page import="spectrum.rank.vo.RankVO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	RankVO rv = (RankVO) request.getAttribute("rv");

	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<title>등급정보 변경</title>
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
	<form action="<%=request.getContextPath()%>/rank/rankupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberId" value="<%=rv.getMemberId()%>">
		<div class="table-div">
		<table class="table table-hover">
			<tr class="table-active">
				<td>I D:</td>
				<td><%=rv.getMemberId()%></td>
			</tr>
			<tr class="table-active">
				<td>등급:</td>
				<td><input type="text" name="rankMemrank" class="form-control" id="inputEmail3" value="<%=rv.getRankMemrank()%>"></td>
			</tr>
	
			
		</table>
		 <a href="rankdetail.do?memberId=<%=rv.getMemberId()%>">뒤로</a> 
	<input type="submit" value="등급정보 수정">
		
		
	</div>
	</form>
</body>
</html>