
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	

<%
	//List<BoardVO> boardList =(List<BoardVO>)request.getAttribute("list");
	List<MbtiBoardVO> mbtiBoardList = (List<MbtiBoardVO>)request.getAttribute("mvl");
	String mbtiBoard;
	
	if(mbtiBoardList.size()<1){
		mbtiBoard=(String)request.getAttribute("mbtiBoard");
	}else{
		mbtiBoard=mbtiBoardList.get(0).getmbtiboardClassificationcode();
	}
	
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
<title>Insert title here</title>

<style>



</style>

</head>
<body>

	
<div class="card" style="margin: 20%;
    margin-top: 0;
    margin-bottom: 0;">
  <div class="card-header">
    댓글
  </div>
  <ul class="list-group list-group-flush">
   
<% 
if(mbtiBoardList !=null&&mbtiBoardList.size()>0){	
	for(int i = 0 ; i <mbtiBoardList.size(); i++){
		String content = mbtiBoardList.get(i).getmbtiboardContent();
		
		
		
%>

 <li class="list-group-item row"><span><%=mbtiBoardList.get(i).getMemberNickname()%></span><span><%=mbtiBoardList.get(i).getmbtiboardContent()%></span><span class="text-muted"><%=mbtiBoardList.get(i).getmbtiboardDate().substring(0, 16)%></span></li>
   
		
<% 
	}
%>
	
<% 
}else{
%>
	 <li class="list-group-item row"><span>댓글이 없습니다</span></li>
	
<% 
}
%>
	</ul>
</div>
<%
	if(msg =="성공"||msg=="실패"){
		
	
%>
	
	<script >
	
	alert("<%=msg%>");
	</script>
<%
	}
%>

</body>
</html>