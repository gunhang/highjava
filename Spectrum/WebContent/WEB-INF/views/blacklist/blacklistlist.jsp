<%@page import="spectrum.blacklist.vo.BlacklistVO"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<BlacklistVO> blackList =
					(List<BlacklistVO>) request.getAttribute("blackList");	

	String msg = request.getParameter("msg") == null
			? "" :request.getParameter("msg");
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>블랙리스트 목록</title>
<style>
.table-div{
    padding: 20%;
    padding-top: 0;
    }
  .table > tbody {
    vertical-align: middle;
}
h1 {
	margin-top: 30px;

}
</style>
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>
<div class="table-div">
<h1>블랙리스트 관리</h1>

<table class="table table-hover">
	<tr class="table-active" >
		<th scope="col">블랙리스트 번호</th>
		<th scope="col">아이디</th>
		
	</tr>
	<%
		int blackSize = blackList.size();
		if(blackSize > 0) {
			for(int i=0; i < blackSize; i++){
			if(blackList.get(i).getBlacklistBlackyn().equals("Y")){
				
		
	%>
	<tr class="table-active">
		<td scope="col"><%=blackList.get(i).getBlacklistNumber() %></td>
		<td scope="col"><a href="blacklistdetail.do?blacklistNumber=<%=blackList.get(i).getBlacklistNumber()%>"><%=blackList.get(i).getMemberId() %></a></td>
	
	</tr>
	<%
			}
			}
	}else{
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
		alert("정상적으로 처리되었습니다.");
	</script>
<%		
	}
%>
<td scope="col"><a class="nav-link" href="blacklistinsert.do"
          onclick="window.open(this.href, '_blank', 'width=1000, height=600, left=450, top=150,toolbars=no,scrollbars=no'); return false;">블랙리스트 추가</a></td>
	<!-- <a href="blacklistinsert.do">[블랙리스트 추가]</a> -->
</div>
	 
</body>
</html>