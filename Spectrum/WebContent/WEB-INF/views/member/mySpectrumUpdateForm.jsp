<%@page import="spectrum.myspectrum.vo.SpectrumAttachFileVO"%>
<%@page import="java.util.List"%>
<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
       SpectrumBoardVO sv = (SpectrumBoardVO) request.getAttribute("sv");
      
      
     List<SpectrumAttachFileVO> atchFileList = (List<SpectrumAttachFileVO>)request.getAttribute("atchFileList"); 
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">


<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
</head>
<body>

<div id="header">
    <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>



  <!-- <form action="/ServletExam2/member/update.do" method="post"> -->
  <!--enctype="multipart/form-data"  -->
  <form action="<%=request.getContextPath() %>/mySpectrumUpdate.do" method="post" enctype="multipart/form-data">
  <input type="hidden" name="memberId" value="<%=sv.getMemberId()%>">
  <%-- <input type="hidden" name="atchFileId" value="<%=mv.getAtchFileId() %>"> --%>
  
    <table>
      <tr>
       <td>아이디</td>
        <td><%=sv.getMemberId() %></td>
      </tr>
       <tr>
       <td>일렬번호</td>
       <td><%=sv.getSpecbrdParentserialnum()%></td>
      </tr>
      <tr>
       <td>내용</td>
       <td><textarea name="specbrdCn" rows="3" cols="40"><%=sv.getSpecbrdCn()%></textarea></td>
      </tr>
       <tr>
       <td>좋아요 수</td>
       <td><%=sv.getSpecbrdLikenum()%></td>
      </tr>
       <tr>
       <td>부모 일렬 번호</td>
       <td><%=sv.getSpecbrdParentserialnum()%></td>
      </tr>
      <tr>
       <td>작성날짜</td>
       <td><%=sv.getSpecbrdDate()%></td>
      </tr>
   
   
      
	</table>
    <input type="submit" value="게시물 수정 완료">
    
   
  
  
   </form>

     <tr>
         <td>기존 첨부파일 : </td>
         <td>
         <%
            if(atchFileList != null){
            	for(SpectrumAttachFileVO fileVO : atchFileList){
            	%>
            	  <div><a href="#"><%=fileVO.getSpctatcdtlOriginalname() %></a></div>
            	<% 
            }
            }
         %>
         </td>
       </tr>
       
       <tr>
       <td>새로운 첨부파일 : </td>
       <td><input type="file" name="atchFile" multiple="multiple"></td>
       </tr> 


</body>
</html>