<%@page import="spectrum.board.vo.QuestionAnswerBoardVO"%>
<%@page import="spectrum.board.vo.QuestionBoardVO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   QuestionBoardVO qbv = (QuestionBoardVO) request.getAttribute("qbv");
//   if(qbv.getQuestionboardAnsweryn().equals("Y")){
      
//   }
//   QuestionAnswerBoardVO qabv = (QuestionAnswerBoardVO) request.getAttribute("qabv");
//    if(qbv.getQuestionboardAnsweryn().equals("Y")){   
//    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q & A</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>
<div id="detailPadding" style="padding-top:100px;"></div>
<div class="card" style="margin: 20%;
    margin-top: 0;
    margin-bottom: 0;">
  <div class="card-header text-center">
   <small class="text-muted" style="display: grid;"></small>질문 제목 : <%=qbv.getQuestionboardTitle() %> 
  </div>
  <div class="card-body">
  <p class="card-title text-end">작성자 : <%=qbv.getMemberId() %></p>
    <p class="card-text"><%=qbv.getQuestionboardContent() %></p>
    <div class="row" style="justify-content: space-around; margin-inline: 25%;">
    <a href="questionlist.do" class="btn btn-secondary" style="width: auto;">목록</a>
    <%if(qbv.getMemberId().equals(session.getAttribute("memberId"))) {%>
   <a href="questionupdate.do?questionboardNumber=<%=qbv.getQuestionboardNumber()%>" class="btn btn-outline-danger" style="width: auto;">수정</a>
   <a href="questiondelete.do?questionboardNumber=<%=qbv.getQuestionboardNumber()%>" class="btn btn-outline-danger" style="width: auto;">삭제</a>
   <% } %>
   </div>
  </div>
  <div class="card-footer text-muted">
    <%=qbv.getQuestionboardDate().substring(0, 16)%>
  </div>
  
  
</div>


<div class="card" style="margin: 20%;
    margin-top: 10px;
    margin-bottom: 0;">
  <div class="card-header">
    답변
  </div>
  <ul class="list-group list-group-flush">

   <%
      
      if(qbv.getQuestionboardAnsweryn().equals("Y")){
         QuestionAnswerBoardVO qabv = (QuestionAnswerBoardVO) request.getAttribute("qabv");
         
%>      

      <li class="list-group-item row"><span><%=qabv.getAdminId() %></span><span><%=qabv.getQstn_ansbrdCn() %></span></li>
 
      
<%
      }else{
 %>      
         
         <li class="list-group-item row"><span>답변 대기중 입니다.</span></li>
            
<%       
      }%>
       </ul>
       <%   if(qbv.getQuestionboardAnsweryn().equals("Y")&&session.getAttribute("adminId")!=null){%>
       <div class="row card-body" style="justify-content: space-around; margin-inline: 25%;">
   <a href="questionAnswerupdate.do?questionboardNumber=<%=qbv.getQuestionboardNumber()%>" class="btn btn-outline-danger" style="width: auto;">답변 수정</a>
   <a href="questionAnswerdelete.do?questionboardNumber=<%=qbv.getQuestionboardNumber()%>" class="btn btn-outline-danger" style="width: auto;">답변 삭제</a>
   </div>
   <% } %>
   <% 
      if(qbv.getQuestionboardAnsweryn().equals("N")&&session.getAttribute("adminId")!=null){
%>            <div class="row card-body" style="justify-content: space-around; margin-inline: 25%;">
         <a href="questionAnswerinsert.do?questionboardNumber=<%=qbv.getQuestionboardNumber()%>" class="btn btn-outline-danger">답변 작성</a>
            </div>
<%
      }
%>      
   </div>
   
         
</body>
</html>