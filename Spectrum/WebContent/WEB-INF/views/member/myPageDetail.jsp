<%@page import="spectrum.myspectrum.vo.SpectrumAttachFileVO"%>
<%@page import="java.util.List"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
      MemberVO mv = (MemberVO) request.getAttribute("mv");
        
   /*  List<SpectrumAttachFileVO> atchFileList = (List<SpectrumAttachFileVO>)request.getAttribute("atchFileList"); */
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<div id="mySpectrumDetail">
   <table border="1" class="table table-hover">
    <tr>
       <td scope="row">아이디</td>
       <td><%=mv.getMemberId() %></td>
    </tr>

<%--     <tr>
       <td scope="row">비밀번호</td>
       <td><%=mv.getMemberPassword() %></td>
    </tr> --%>
   
     <tr>
       <td scope="row">이름</td>
       <td><%=mv.getMemberName() %></td>
    </tr>
    
      <tr>
       <td scope="row">휴대폰 번호</td>
       <td><%=mv.getMemberPhonenum() %></td>
    </tr>
    
      <tr>
       <td scope="row">생년월일</td>
       <td><%=mv.getMemberBirth() %></td>
    </tr>
    
      <tr id="Reg">
       <td scope="row">주민등록 번호</td>
       <td><%=mv.getMemberRegno() %></td>
    </tr>
    
    <tr>
       <td scope="row">주소</td>
       <td><%=mv.getMemberAddr1() + mv.getMemberZipcode()%></td>
    </tr>
    
    <tr>
       <td scope="row">상세주소</td>
       <td><%=mv.getMemberAddr2() %></td>
    </tr>
   
    <tr>
       <td scope="row">닉네임</td>
       <td><%=mv.getMemberNickname() %></td>
    </tr>

    <tr>
       <td scope="row">회원가입일</td>
       <td><%=mv.getMemberSigndate() %></td>
    </tr>
   
    <tr>
       <td scope="row">이메일</td>
       <td><%=mv.getMemberMail() %></td>
    </tr>
   
    <tr>
       <td scope="row">하트 보유 개수</td>
       <td><%=mv.getMemberHartnum() %></td>
    </tr>
  
   </table>
     
  <div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-secondary"><a href="mySpectrumList.do">MY SPTECTRUM</button>
  <button type="button" class="btn btn-secondary"><a href="myPageUpdate.do?memId=<%=mv.getMemberId()%>">MY PAGE 수정</button>
  <button type="button" class="btn btn-secondary"><a href="myPageDelete.do?memId=<%=mv.getMemberId()%>">회원 탈퇴</button>
</div>


</div>
   <script>
   str("#Reg");
// null 체크
   checkValueNull  function (str){
       if(typeof str == "indefined" || str == null || str == "")
       {
           return true;
       }
       else
       {
           return false;
       }
   },

   // 마스킹
   maksMaskingValue : function (str)
   {
       var preMaskingData = str;
       var MaskingData = "";
       var len = "";

       
       // 주민번호 마스킹 
       // 원본   : 000101-1234567
       // 마스킹 : 000101-1******

       // - 있을 경우
       var rrnMatchValue = MaskingData
                        .match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
       if(checkValueNull(rrnMatchValue) == true)
       {
           MaskingData = MaskingData;
       }
       else
       {
           len = rrnMatchValue.toString().split('-').length;
           MaskingData = MaskingData.toString().replace(rrnMatchValue,rrnMatchValue.toString()
                         .replace(/(-?)([1-4]{1})([0-9]{6})\b/gi,"$1$2******"));
       }

       // - 없을 경우
       rrnMatchValue = MaskingData.match(/\d{13}/gi);
       if(checkValueNull(rrnMatchValue) == true)
       {
           MaskingData = MaskingData;
       }
       else
       {
           MaskingData = MaskingData.toString().replace(rrnMatchValue,rrnMatchValue.toString()
                         .replace(/([0-9]{6})$/gi,"******"));
       }

    

       return MaskingData;

   
   
   
   
   
   </script>
   
   
</body>
</html>