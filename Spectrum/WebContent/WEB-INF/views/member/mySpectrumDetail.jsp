<%@page import="spectrum.myspectrum.vo.SpectrumAttachFileVO"%>
<%@page import="java.util.List"%>

<%@page import="spectrum.myspectrum.vo.SpectrumBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     
   
      SpectrumBoardVO sv = (SpectrumBoardVO) request.getAttribute("sv");
      
      
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<style>

#report{

 width: 600px;
 height: 100px;

}
textarea{
	overflow-y: scroll;
}
#mbtiBoardDetail{
	padding-left: 10%;
	padding-right: 10%;

}
#boardDetailContent{
	height: 150px;
}
#detailPadding{
padding-top:100px;
}
.card{
	margin: 20%;
    margin-top: 0;
    margin-bottom: 0;
}
.accordion{
	margin: 20%;
    margin-top: 0;
    margin-bottom: 0;

}



</style>



</head>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<body>
   <table border="1">

   
    <tr>
       <td>내용</td>
       <td><%=sv.getSpecbrdCn() %></td>
    </tr>
    
     <tr>
       <td>좋아요 수</td>
       <td><%=sv.getSpecbrdLikenum() %></td>
    </tr>
    
    
    <tr>
       <td>작성날짜</td>
       <td><%=sv.getSpecbrdDate()%></td>
    </tr>
    

     <tr>
        <td colspan="2">
           <a href="mySpectrumList.do">[MY SPECTRUM]</a>
           <a href="mySpectrumDelete.do?boardNum=<%=sv.getSpecbrdSrlnmbr()%>">[게시물 삭제]</a>
      </td>
     </tr>
     
     <tr>
         <td>
         </td>
       </tr>
   
   </table>
      <textarea id="textarea" rows="" cols=""></textarea>
      <button type="button" id="send">전송</button>
   
   
   <div id="boardreInsert"></div>
   
   <div id="boardre"></div>
   
   
   
   <%
         if(!sv.getMemberId().equals(session.getAttribute("memberId"))){
 
   %>
   
   
   


   
   
   <div id="report">
   </div>
   <%
         }
   %>
   
   
   
   <script>
   $(document).ready(function(){

     $.ajax({
             type : 'get'
            ,url : "/Spectrum/memberReport.jsp"      //요청
            ,dataType : 'html'  
            ,data : {reportId : '<%=sv.getMemberId()%>' ,
                     postNum:'<%=sv.getSpecbrdSrlnmbr()%>' 
                     }  //응답(필수)
            ,success : function(data){
                $('#report').html(data);
            }   //응답(필수)
            ,error : function(xhr){
                  alert("상태 >> " + xhr.status);
            }                  //응답(필수)
            });
           });
   
   
   $("#send").click(function(){

     $.ajax({
             type : 'get'
            ,url : "/Spectrum/myspectrumboardre/spectrumboardrelist"      //요청
            ,dataType : 'html'  
               ,data : {boardNum : "<%=sv.getSpecbrdSrlnmbr()%>" }//응답(필수)
            ,success : function(data){
              $('#boardre').html(data);
            }   //응답(필수)
            ,error : function(xhr){
               alert("상태 >> " + xhr.status);
            }                  //응답(필수)
            });
           });
   
   
   $("#send").click(function(){
       let content =$('#textarea').val()
      
        $.ajax({
                type : 'get'
               ,url : "/Spectrum/myspectrumboardre/spectrumboardreinsert"      //요청
               ,dataType : 'html'  
                  ,data : {boardNum : "<%=sv.getSpecbrdSrlnmbr()%>" ,
                        boardContent : content }//응답(필수)
               ,success : function(data){
                 $('#boardreInsert').html(data);
               }   //응답(필수)
               ,error : function(xhr){
                  alert("상태 >> " + xhr.status);
               }                  //응답(필수)
               });
              });
   
   $(document).ready(function(){

	     $.ajax({
	             type : 'get'
	            ,url : "/Spectrum/myspectrumboardre/spectrumboardrelist"      //요청
	            ,dataType : 'html'  
	               ,data : {boardNum : "<%=sv.getSpecbrdSrlnmbr()%>" }//응답(필수)
	            ,success : function(data){
	              $('#boardre').html(data);
	            }   //응답(필수)
	            ,error : function(xhr){
	               alert("상태 >> " + xhr.status);
	            }                  //응답(필수)
	            });
	           });

</script>
   
   
   
</body>
</html>