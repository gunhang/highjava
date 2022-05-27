<%@page import="spectrum.anonymouseboard.AnonymouseBoardVO"%>
<%@page import="spectrum.rank.controllor.getALLMemberWhiteListServlet"%>
<%@page import="spectrum.mbtiboard.service.MbtiBoardService"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 MemberVO mv = (MemberVO)session.getAttribute("mv");
String mbtiCode = (String) session.getAttribute("mbtiCode");
	 
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	

<%
	List<AnonymouseBoardVO> anonyList = (List<AnonymouseBoardVO>)request.getAttribute("anonyList");
/*  이거 잘못수정 */
	
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>익명 게시판</title>
<script src="../jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<% if(mv == null){ %>
<script>

  alert("로그인 후 이용가능합니다.");
  history.go(-1);

</script>
<%  %>
<%  } else if(mbtiCode == null || mbtiCode.equals("0")){ %>

<script>
  alert("MBTI 검사 후 이용가능합니다.");
  history.go(-1);

</script>
<% } %>
<style>
.table-div{
    padding: 20%;
    padding-top: 10px;
    }
  .table > tbody {
    vertical-align: middle;
}
.container{
padding-top: 100px;
}
.container > form{
justify-content: center;
}

</style>
</head>
<body>



<div >
	 <%@include file="/navbar.jsp" %>
</div>


<div class="container">
<form action="mbtiboardserch" method="post" class="row">
	<select name="searchKey" class="form-select" style="width: auto;  margin: 5px;">
	<option value="code">말머리</option> 
	<option value="title">제목</option> 
	<option value="content">내용</option> 
	</select> 
	<input type="text" name="searchValue" class="form-control" style="width: 50%; margin: 5px;">
	<input type="submit" value="검색"  class="btn btn-outline-light" style="width: auto; margin: 5px;">
</form>
</div>


<div class="table-div">
	<table class="table table-hover">
		<tr>
			<th style="font-size: 1.4rem;">익명 게시판</th>
		<th><a href="anonyboardinsert" class="btn btn-outline-light">게시글 작성</a></th>
		</tr>
		<tr class="table-active">
			<th>머릿말</th>
			<th>MBTI</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
<% 
if(anonyList !=null&&anonyList.size()>0){	
	for(int i = 0 ; i <anonyList.size(); i++){

%>

		<tr class="table-active">
			<td><%=anonyList.get(i).getAnonymouseboardType()%></td>
			<td><%=anonyList.get(i).getMbticode()%></td>
			<td><a href="<%=request.getContextPath()%>/anonyboard/anonydetail?postNum=<%=anonyList.get(i).getAnonymouseboardPostnum()%>"><%=anonyList.get(i).getAnonymouseboardTitle()%></a></td>
			<td><%=anonyList.get(i).getAnonymouseboardDate().substring(0, 16)%></td>
		</tr>
	
		
<% 
	}
   
    %>
	
	
	<%
    
    
	%>
<% 
}else{
%>
	<tr >
		<td colspan="4">게시물이 없습니다</td>
	</tr>
	
	
<% 
}
%>
	

	</table>
	</div>







</body>
</html>