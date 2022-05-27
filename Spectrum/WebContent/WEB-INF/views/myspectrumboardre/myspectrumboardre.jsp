
<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	

<%
	//List<BoardVO> boardList =(List<BoardVO>)request.getAttribute("list");
	List<SpectrumBoardVO> sbv = (List<SpectrumBoardVO>)request.getAttribute("sbv");
	
	
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>

.mbtiBoardDetailContent{


}
.mbtiBoardDetailNumber{
width: 80px;
}
.mbtiBoardDetailNickname{
width: 100px;
}
.mbtiBoardDetailDate{
width: 170px;'
}

</style>

</head>
<body>

	
	<table class="table">
		<tr>
			<th class="mbtiBoardDetailNumber">번호</th>
			<th class="mbtiBoardDetailNickname">닉네임</th>
			<th class="mbtiBoardDetailDate">날짜</th>
			<th class="mbtiBoardDetailContent">내용</th>
			<th class="mbtiBoardDetailNumber">삭제</th>
		</tr>
<%  
if(sbv !=null&&sbv.size()>0){	
	for(int i = 0 ; i <sbv.size(); i++){
		String content = sbv.get(i).getSpecbrdCn();
		
		
		
%>
		
		
		<tr>
		
			<td class="mbtiBoardDetailNumber"><a href="myspectrumboardre/spectrumboardreupdate?boardPostnum=<%=sbv.get(i).getSpecbrdSrlnmbr()%>"><%=sbv.get(i).getSpecbrdSrlnmbr()%>수정</a></td>
			<td class="mbtiBoardDetailNickname"><%=sbv.get(i).getMemberNickname()%></td>
			<td class="mbtiBoardDetailDate"><%=sbv.get(i).getSpecbrdDate()%></td>
			<td class="mbtiBoardDetailContent"><%=content%></td>
			
			<td class="mbtiBoardDetailNumber"><a href="myspectrumboardre/spectrumboardredelete?boardPostNum=<%=sbv.get(i).getSpecbrdSrlnmbr()%>">
			<%=sbv.get(i).getSpecbrdSrlnmbr()%>삭제</a></td>
			
			
		</tr>
	
		
<%  
	}
%>
	
	
<% 
}else{
%>
	<tr >
		<td colspan="4">댓글이 없습니다</td>
	</tr>
	
<% 
}
%>
	

</body>
</html>