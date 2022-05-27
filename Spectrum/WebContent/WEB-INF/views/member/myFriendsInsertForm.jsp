<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@page import="spectrum.myspectrum.vo.mySpectrumListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   /*  mySpectrumListVO lv = (mySpectrumListVO) request.getAttribute("lv"); */
 
    SpectrumBoardVO sv = (SpectrumBoardVO) request.getAttribute("sv");
    
    String memberId = (String)session.getAttribute("memberId");
    %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 등록</title>
 <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">

 <form action="mySpectrumInsert.do" method="post"> 
 
  	<input type="hidden" value="<%=memberId%>" name="memberId">
  	<input type="hidden" value="<%= %>" name="friendAppliedId">
  	<input type="hidden" value="<%=memberId%>" name="friendRequestedId">


</head>
<body>

<script type="text/javascript">
alert('CONNECT 요청이 정상적으로 처리되었습니다.');
window.location = '/myFriendsList.do';
</script>






<%-- 
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<style>
#mySpectrumDetail{
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 5%;
	padding-bottom: 5%;
}
</style>
</head>
<body>


 <form action="mySpectrumInsert.do" method="post" enctype="multipart/form-data"> 
  	<input type="hidden" value="<%=memberId%>" name="memberId">


  <div id="mySpectrumDetail">
      <table border="1" class="table table-hover">
       <tr>
       <td scope="row">내용</td>
      <td><textarea name="specbrdCn" rows="3" cols="40" class="btn btn-secondary"></textarea></td>
       
      </tr>
     
      <tr>
       <td scope="row">첨부파일</td>
       <td><input type="file" name="atchFile" class="btn btn-secondary"></td> 
      </tr>
    </table>
    
    <button type="submit" class="btn btn-secondary">게시물 등록</button>
  
    </div>
  </form> --%>
</body>
</html>