<%@page import="spectrum.rank.controllor.getALLMemberWhiteListServlet"%>
<%@page import="spectrum.mbtiboard.service.MbtiBoardService"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 String mbtiBoard=(String)request.getAttribute("mbtiBoard");
	 MemberVO mv = (MemberVO)session.getAttribute("mv");
	 String memberMbti="";
	 if(mv!=null){
	 	memberMbti = mv.getMbticode();
	 }	 
	
	 int totalCount = MbtiBoardService.getInstance().totalCount(mbtiBoard);
	 int listCount =10;
	 int totalPage = totalCount / listCount  ;


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	

<%
	//List<BoardVO> boardList =(List<BoardVO>)request.getAttribute("list");
	List<MbtiBoardVO> mbtiBoardList = (List<MbtiBoardVO>)request.getAttribute("mbtiBoardList");
	
	String msg;
	if( request.getAttribute("msg")==null){
		msg="";
	}else{
		msg=(String)request.getAttribute("msg");
	}
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=mbtiBoard%> 게시판</title>
<script src="../jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
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



<div id="header">
	 <%@include file="/navbar.jsp" %>
</div>


<div class="container">
<form action="mbtiboardserch" method="post" class="row">
	<select name="searchKey" class="form-select" style="width: auto;  margin: 5px;">
	<option value="code">말머리</option> 
	<option value="title">제목</option> 
	<option value="content">내용</option> 
	</select> 
	
	<input type="hidden" name="mbtiBoard" value="<%=mbtiBoard%>">
	<input type="text" name="searchValue" class="form-control" style="width: 50%; margin: 5px;">
	<input type="submit" value="검색"  class="btn btn-outline-light" style="width: auto; margin: 5px;">
</form>
</div>

	

<div class="table-div">
	<table class="table table-hover">
		<tr>
			<th style="font-size: 1.4rem;"><%=mbtiBoard%> 게시판</th>
		<%	if(memberMbti.equals(mbtiBoard)){
    %>
	  
		<td><a href="mbtiboardinsert?mbtiBoard=<%=mbtiBoard%>" class="btn btn-outline-light">게시글 작성</a></td>
	
	
	<%} %>
		</tr>
		<tr class="table-active">
			<th>머릿말</th>
			<th>닉네임</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
<% 
if(mbtiBoardList !=null&&mbtiBoardList.size()>0){	
	for(int i = 0 ; i <mbtiBoardList.size(); i++){

%>

		<tr class="table-active">
			<td><%=mbtiBoardList.get(i).getmbtiboardTypecode()%></td>
			<td><%=mbtiBoardList.get(i).getMemberNickname()%></td>
			<td><a href="<%=request.getContextPath()%>/mbtiboard/mbtiboarddetail?mbtiboardPostnum=<%=mbtiBoardList.get(i).getmbtiboardPostnum()%>"><%=mbtiBoardList.get(i).getmbtiboardTitle()%></a></td>
			<td><%=mbtiBoardList.get(i).getmbtiboardDate().substring(0, 16)%></td>
		</tr>
	
		
<% 
	}
    %>
	<tr>	
  <div class="btn-toolbar">
  <td></td>
  <td></td>
  <td style="text-align: center;">
  	<a href="mbtiboardlist?mbtiBoard=<%=mbtiBoard%>&start=0&end=<%=mbtiBoardList.get(0).getmbtiboardPostnum()%>" class="btn btn-secondary">뒤로</a>
  	<a href="mbtiboardlist?mbtiBoard=<%=mbtiBoard%>&start=1&end=<%=mbtiBoardList.get(mbtiBoardList.size()-1).getmbtiboardPostnum()%>" class="btn btn-secondary">앞으로</a>
  </td>
	<td></td>
	<td></td>
	</div>
	</tr>
<% 
}else{
%>
	<tr >
		<td colspan="4">게시물이 없습니다</td>
	</tr>
	
	<tr>	
  <div class="btn-toolbar">
  <td></td>
  <td></td>
  <td style="text-align: center;">
  <%
  if(mbtiBoardList.size()>0){ 
  
  %>
  	<a href="mbtiboardlist?mbtiBoard=<%=mbtiBoard%>&start=0&end=<%=mbtiBoardList.get(0).getmbtiboardPostnum()%>" class="btn btn-secondary">뒤로</a>
  	<a href="mbtiboardlist?mbtiBoard=<%=mbtiBoard%>&start=1&end=<%=mbtiBoardList.get(mbtiBoardList.size()-1).getmbtiboardPostnum()%>" class="btn btn-secondary">앞으로</a>
  <%
  
  }
  %>
  
  </td>
	<td></td>
	<td></td>
	</div>
	</tr>
<% 
}
%>
	
<%
	if(msg =="성공"||msg=="실패"){
		
	
%>
	</table>
	</div>
	

	
	
	<script >
	
	alert("<%=msg%>");
	</script>
<%
	}
%>





</body>
</html>