<%@page import="spectrum.myspectrum.vo.FriendVO"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  List<FriendVO> memListN = (List<FriendVO>) request.getAttribute("memListN");
  List<FriendVO> memListY = (List<FriendVO>) request.getAttribute("memListY");
  String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
  String memId =(String)session.getAttribute("memberId");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구 및 요청친구 리스트</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<style>
#myFriendsList{
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
  
  <div id="myFriendsList">
                 <table class="table table-hover">
                      <tr>
                      <th scope="col" colspan="3">CONNECT List </th>
                  
                       </tr>
             <%
             int memSize = memListN.size();
             if(memSize > 0){
             for(int i=0; i<memSize; i++){
          
               if(memListN.get(i).getFriendAppliedId().equals(memId)){
     
                  %>
                  
                                            
                      
                   <tr>
                     <td>프로필 사진</td>
                     <td><h8 class="g47SY lOXF2">아이디</h8><h6 class="_7UhW9       fKFbl yUEEX   KV-D4              fDxYl     "><a href="mySpectrumList.do?friendId=<%=memListN.get(i).getFriendRequestedId()%>"><%= memListN.get(i).getFriendRequestedId() %></a></h6></td>
                        <td><button type="button" class="btn btn-secondary" onclick="location.href='myFrindsUpdate.do?friendId=<%=memListN.get(i).getFriendRequestedId()%>';">connect</button>
                 
               </td>
                   </tr>
               
                  <%      
               
               
               }
       } 
       }else{
             %>
                   
       
               <tr>
                <td colspan="3">CONNECT 요청한 회원이 없습니다.</td><p>
             </tr>
          
             <%
             }
             %>
          </table>

          <%
            if(msg.equals("성공")){
          %>
          <script>
             alert('정상적으로 처리되었습니다.');
          </script>
          <%
            }
          %>
    
    
    
    
       <table class="table table-hover">
       
        <tr>
          <th scope="col" colspan="3">MY FRIENDS LIST</th>
              <th></th>
                 
        </tr>
     
       <%
       memSize = memListY.size();
       if(memSize > 0){
          for(int i=0; i<memSize; i++){
           
          if(memListY.get(i).getFriendAppliedId().equals(memId)){
      %>
    
     
       
       
     <tr>
       <td>프로필 사진</td>
       <td><h8 class="g47SY lOXF2">아이디</h8><h6 class="_7UhW9       fKFbl yUEEX   KV-D4              fDxYl     "><a href="mySpectrumList.do?friendId=<%=memListY.get(i).getFriendRequestedId()%>"><%= memListY.get(i).getFriendRequestedId() %></a></h6></td>
       <td><button type="button" class="btn btn-secondary" onclick="location.href='myFriendsDelete.do?memId=<%=memListY.get(i).getFriendRequestedId()%>';">Disconnect</button>
     </tr>
  <%
         }
         }
      }else{
      %>
      
 
      
      <tr>
         <td colspan="3" >연결된 친구가 없습니다.</td><p>
      </tr>
      <%
      }
      %>
   </table>
   </div>

   <%
     if(msg.equals("성공")){
   %>
   <script>
      alert('정상적으로 처리되었습니다.');
   </script>
   <%
     }
   %>
   
   
   
</body>
</html>