
<%@page import="spectrum.myspectrum.vo.mySpectrumListVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    mySpectrumListVO lv = (mySpectrumListVO) request.getAttribute("lv");
    String memberId = (String)session.getAttribute("memberId");
    %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 등록</title>
</head>
<body>
 <form action="mySpectrumInsert.do" method="post" enctype="multipart/form-data"> 
  	<input type="hidden" value="<%=memberId%>" name="memberId">
    <table border="1">
     <tr>
      <td colspan="2">프로필사진</td>
     </tr>
     
      <tr>
      <td><input type="text" name="memberNickname" value="<%=lv.getMemberNickname() %>"></td>
      <td><input type="text" name="mbticode" value="<%=lv.getMbticode() %>"></td>
      </tr>
      
      <tr>
      <td colspan="2"><input type="text" name="memberStatusmessage" value="<%=lv.getMemberStatusmessage()%>"></td>
      </tr>
     </table>

      <input type="submit" value="프로필 등록">
  
  </form>
</body>
</html>