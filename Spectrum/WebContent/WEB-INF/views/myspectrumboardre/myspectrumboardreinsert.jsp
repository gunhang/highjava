<%@page import="spectrum.myspectrum.boardre.service.MyspectrumBoardReService"%>
<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.table textarea{
	overflow-y: scroll;
}
</style>
</head>

<body>

<form action="/Spectrum/myspectrumboardre/spectrumboardreinsert" method="post">
			
			
			
			
			
			<%
			String boardNum=request.getParameter("boardNum");
			String memberId=(String)session.getAttribute("memberId");
			String boardContent=request.getParameter("boardContent");
			
			SpectrumBoardVO sbv= new SpectrumBoardVO();
			
			sbv.setSpecbrdParentserialnum(boardNum);
			sbv.setMemberId(memberId);
			sbv.setSpecbrdCn(boardContent);
			
			
			MyspectrumBoardReService.getInstance().spectrumBoardInsert(sbv);
			
			
			%>
			
			
		
		<input type="submit" value="게시글 등록">
	</form>
</body>
</html>