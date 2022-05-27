<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@page import="spectrum.myspectrum.vo.mySpectrumListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   /*  mySpectrumListVO lv = (mySpectrumListVO) request.getAttribute("lv"); */
 
    SpectrumBoardVO sv = (SpectrumBoardVO) request.getAttribute("sv");
    
    String memberId = (String)session.getAttribute("memberId");
    %>
     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 등록</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/js/summernote/summernote-lite.js"></script>

<style>
#mySpectrumDetail{
   padding-left: 20%;
   padding-right: 20%;
   padding-top: 15%;
   padding-bottom: 15%;
}
</style>
<!--  <form action="mySpectrumInsert.do" method="post" id="summernote" >  -->
</head>

<body>

  <form action="mySpectrumInsert.do" method="post" enctype="multipart/form-data"> 
     <input type="hidden" value="<%=memberId%>" name="memberId">

  <div id="mySpectrumDetail">
      <table border="1" >
       <tr>
       <td scope="row">내용</td>
      <td><textarea name="specbrdCn"  id="summernote" ></textarea></td>
       
      </tr>
     
      <tr>
    </table>
    
    <button type="submit"   class="btn btn-secondary">게시물 등록</button>
  
    </div>
    </form>
 
  <script>
$(document).ready(function() {
   //여기 아래 부분
   $('#summernote').summernote({
        height: 700,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
          
   });
});
</script>
  
  
</body>
</html>