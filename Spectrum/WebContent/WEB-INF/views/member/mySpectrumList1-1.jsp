<%@page import="spectrum.myspectrum.vo.SpectrumAttachFileVO"%>
<%@page import="kr.or.ddit.comm.service.SpectrumAtchFileServiceImpl"%>
<%@page import="javax.xml.stream.Location"%>
<%@page import="java.awt.Window"%>
<%@page import="spectrum.myatc.service.MyAtcServiceImpl"%>
<%@page import="spectrum.myatc.service.IMyAtcService"%>
<%@page import="spectrum.myatc.vo.MyAtcVO"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.myspectrum.vo.mySpectrumListVO"%>


<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
            List<mySpectrumListVO> memList = (List<mySpectrumListVO>)  request.getAttribute("memList");

            String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
            String memberId= (String)session.getAttribute("memberId");
         	MemberVO mv = (MemberVO)session.getAttribute("mv");
            
            IMyAtcService atcService = MyAtcServiceImpl.getInstance(); 
            String myflofileatcId= atcService.getAtcId(memberId);
            
            List<MyAtcVO> atcdtlList = atcService.getALLAtcDtlList(myflofileatcId);
                             int atcdtlSize = atcdtlList.size();
                             
                  
                             
                        
                           
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-3.6.0.min.js"></script>
<title>게시물 목록</title>
<style>
img{
 width:50px;
 height:50px;
}
</style>
<script>
$('#insert').click(function() {
   location.reload();
   });
</script>
</head>
<body>

   <button type="button" onclick="location.href='myPageDetail.do';">MY PAGE</button>
   <button type="button" onclick="location.href='myFriendsList.do';">MY FRIENDS</button><p>
   
      <%
       int memSize = memList.size();
      %>

  <table border="1">
      <tr>
         <td colspan="2">프로필사진 </td>
   </tr>
      <tr>
       <td><%=mv.getMemberNickname() %></td>
       <td><%=mv.getMbticode() %></td>
      </tr>
      <tr>
       <td colspan="2">멤버상태 메세지</td>
      </tr>
   </table> 

   <table border="1">
       <tr>
        <td colspan="3">
           <a href="profileUpdate.do?memId=<%=memberId%>">[프로필 업데이트]</a>
      </td>
     </tr>
       <%      
             %>
             <%if(atcdtlSize>0){
                for(int j=0; j<atcdtlSize; j++){
             %>      
            <div>
              <img src="<%=request.getContextPath() %>/imeges/<%=atcdtlList.get(j).getMyflofileatcdtlStrefilenm()%>">
            
            </div>
            <%
                }
             } 
             %>
            <td> <a href="profileUpdate.do?memId=<%=memberId%>">[프로필 등록]</a></td>
                <td colspan="3">등록된 프로필이 없습니다.</td><p>
                </tr>
              <tr>
               <td colspan="3">
                  
             </td>
            </tr>
              <tr>
               <td colspan="3">
               <%
                  if(atcdtlSize < 1){
               %>
               
                  <a href="myatcinsert.do" id="insert">[프로필사진 등록]</a><p>
                 <%
                  }
                 
                 %> 
                  <a href="member/atcupdate.do">[프로필사진 수정]</a><p>
             </td>
            </tr>
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
    
    
     
      <%
      memSize = memList.size();
      if(memSize > 0){
         for(int i=0; i<memSize; i++){
            if(memList.get(i).getMemberId().equals(memberId)){
      %>
     
  <table border="1">
         
   
      <tr>
       <td><a href="mySpectrumDetail.do?postNum=<%=memList.get(i).getSpecbrdSrlnmbr()%>"><%= memList.get(i).getSpecbrdSrlnmbr() %> </a></td>
      </tr>
      <tr>
      	<td><a href="mySpectrumDetail.do?postNum=<%=memList.get(i).getSpecbrdSrlnmbr()%>"><%= memList.get(i).getSpecbrdCn() %></a></td>
      <%
            }
         }
      }
      %>
       <tr>
        <td colspan="3">
           <a href="mySpectrumInsert.do?memId=<%=memberId%>">[게시물 등록]</a><p>
         </td>
     </tr>
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
</body>
</html>