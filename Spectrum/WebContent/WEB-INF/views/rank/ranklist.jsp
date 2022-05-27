<%@page import="spectrum.rank.vo.RankVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<RankVO> rankList =
					(List<RankVO>) request.getAttribute("rankList");
	

	String msg = request.getParameter("msg") == null
			? "" :request.getParameter("msg");
	
	
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<title>회원 목록</title>
<style>
table {
    margin-left:auto; 
    margin-right:auto;
}
h1 {
	  margin-left:auto; 
    margin-right:auto;
    /*  border-collapse : collapse; */
    margin-top: 30px;
    margin-bottom: 30px;
}

table, td, th {
   /*  border-collapse : collapse; */
   
    width: 50%
}
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
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>
<div class="table-div">
<h1>등급별 회원 조회</h1>
<table class="table table-hover" >
	<tr class="table-active" >
		<th scope="col">WHITE</th>
		<th scope="col">회원아이디</th>
		
		
	</tr>
	<%
		int rankSize = rankList.size();
		if(rankSize > 0) {
			for(int i=0; i < rankSize; i++){
				
		if(rankList.get(i).getRankMemrank().equals("WHITE") 
				&& rankList.get(i).getMemberWithdrawalyn().equals("N")){
	%>
	<tr class="table-active">
		<td scope="col">WHITE</td>
		<%-- <td scope="col"><a href="rankdetail.do?memberId=<%=rankList.get(i).getMemberId()%>"><%=rankList.get(i).getMemberId() %></a></td> --%>
		<td scope="col"><a class="nav-link" href="rankdetail.do?memberId=<%=rankList.get(i).getMemberId()%>"
          onclick="window.open(this.href, '_blank', 'width=650, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;"><%=rankList.get(i).getMemberId() %></a></td>
			
		
	</tr>
	<%
		}}
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
<table class="table table-hover">
	<tr class="table-active">
		<th scope="col">YELLOW</th>
		<th scope="col">회원아이디</th>
		
		
	</tr>
	<%
			 rankSize = rankList.size();
		if(rankSize > 0) {
			for(int i=0; i < rankSize; i++){
				
		if(rankList.get(i).getRankMemrank().equals("YELLOW")
				&& rankList.get(i).getMemberWithdrawalyn().equals("N")){
	%>
	<tr class="table-active">
		<td scope="col" id="yellowth">YELLOW</td>
		<td scope="col"><a class="nav-link" href="rankdetail.do?memberId=<%=rankList.get(i).getMemberId()%>"
          onclick="window.open(this.href, '_blank', 'width=650, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;"><%=rankList.get(i).getMemberId() %></a></td>
		
	</tr>
	<%
		}}
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
<table class="table table-hover">
	<tr class="table-active">
		<th scope="col">PURPLE</th>
		<th scope="col">회원아이디</th>
		
		
	</tr>
	<%
			 rankSize = rankList.size();
		if(rankSize > 0) {
			for(int i=0; i < rankSize; i++){
				
		if(rankList.get(i).getRankMemrank().equals("PURPLE")
				&& rankList.get(i).getMemberWithdrawalyn().equals("N")){
	%>
	<tr class="table-active">
		<td scope="col">PURPLE</td>
		<td scope="col"><a class="nav-link" href="rankdetail.do?memberId=<%=rankList.get(i).getMemberId()%>"
          onclick="window.open(this.href, '_blank', 'width=650, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;"><%=rankList.get(i).getMemberId() %></a></td>
		
		
	</tr>
	<%
		}}
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
<table class="table table-hover">
	<tr class="table-active">
		<th scope="col">RAINBOW</th>
		<th scope="col">회원아이디</th>
		
		
	</tr>
	<%
			 rankSize = rankList.size();
		if(rankSize > 0) {
			for(int i=0; i < rankSize; i++){
				
		if(rankList.get(i).getRankMemrank().equals("RAINBOW")
				&& rankList.get(i).getMemberWithdrawalyn().equals("N")){
	%>
	<tr class="table-active">
		<td scope="col">RAINBOW</td>
		<td scope="col"><a class="nav-link" href="rankdetail.do?memberId=<%=rankList.get(i).getMemberId()%>"
          onclick="window.open(this.href, '_blank', 'width=650, height=400, left=450, top=150,toolbars=no,scrollbars=no'); return false;"><%=rankList.get(i).getMemberId() %></a></td>
		
		
	</tr>
	<%
		}}
	}else{
	%>
	<tr>
		<td colspan="4">회원 정보가 없습니다.</td>
	</tr>
	<% 
	}
	%>
</table>
</div>
<%
	if(msg.equals("성공")){
%>
	<script>
		alert("정상적으로 처리되었습니다.");
	</script>
<%		
	}
%>
</body>
</html>