<%@page import="spectrum.myatc.service.MyAtcServiceImpl"%>
<%@page import="spectrum.myatc.vo.MyAtcVO"%>
<%@page import="spectrum.myatc.service.IMyAtcService"%>
<%@page import="spectrum.myspectrum.vo.SpectrumAttachFileVO"%>
<%@page import="java.util.List"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
       /* MemberVO mv = (MemberVO) request.getAttribute("mv"); */
       MemberVO mv = (MemberVO)session.getAttribute("mv");
     
       /* String memberId= (String)session.getAttribute("memberId");  */
       
     /*   MyAtcVO ao = (MyAtcVO)session.getAttribute("ao"); */
   /*  List<SpectrumAttachFileVO> atchFileList = (List<SpectrumAttachFileVO>)request.getAttribute("atchFileList"); */
     
         
            
            IMyAtcService atcService = MyAtcServiceImpl.getInstance(); 
            String myflofileatcId= atcService.getAtcId((String)session.getAttribute("memberId"));
            
            List<MyAtcVO> atcdtlList = atcService.getALLAtcDtlList(myflofileatcId);
                             int atcdtlSize = atcdtlList.size();
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 등록 및 업데이트</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">

<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<style>
#profileUpdate{
   padding-left: 20%;
   padding-right: 20%;
   padding-top: 0;
   padding-bottom: 15%;
}
</style>
</head>
<body>

<div id="header">
    <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>


 <form action="profileUpdate.do" method="post" enctype="multipart/form-data"> 
     <input type="hidden" value="<%=memberId%>" name="memberId">


  <div id="profileUpdate">
    <table border="1" class="table table-hover">
     
     
      <tr>
         <td colspan="2">프로필사진 </td>
         
          <% if(atcdtlSize >0){
        	  for(int s=0; s<atcdtlSize; s++){
         if(atcdtlList.get(s).getMyflofileatcdtlOriginalname() ==null){
        		%>  
         <td><button type="button" class="btn btn-primary btn-sm" onclick="location.href='myatcinsert.do?memId=<%=memberId%>';">사진 등록</button></td>
        	 <%
        	  
          } else if(atcdtlList.get(s).getMyflofileatcdtlOriginalname()!=null){
         %>
        	  <td><button type="button" class="btn btn-primary btn-sm" onclick="location.href='member/atcupdate.do?memId=<%=memberId%>';">업데이트</button></td>
        	<%
          }
        	  }
          }
        	%>  
      
      
        
     
     </tr>
      
      <tr>
       <td>닉네임</td>
       <td><%=mv.getMemberNickname() %></td>
       <td></td>
      </tr>
      
      <tr>
       <td>MBTI 검사결과</td>
       <td><%=mv.getMbticode() %></td>
        <td></td>
       
      </tr>
   
      <tr>
      <td>상태메세지</td>
       <td><input type="text" name="memberStatusmessage" value="<%=mv.getMemberStatusmessage() %>"></td>
        <td></td>
      </tr>
   </table> 
 

    <button type="submit" class="btn btn-secondary">프로필 등록</button>
  
   </div>
   </form>


</body>
</html>