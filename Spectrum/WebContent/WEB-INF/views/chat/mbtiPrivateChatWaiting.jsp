<%@page import="spectrum.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    MemberVO mv = (MemberVO) session.getAttribute("mv");
    int memberHartnum = Integer.parseInt(mv.getMemberHartnum());
    String mbtiCode = (String) session.getAttribute("mbtiCode");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%  if(mbtiCode == null || mbtiCode.equals("0")){ %>

<script>
  alert("MBTI 검사 후 이용가능합니다.");
  location.href="/Spectrum/main.jsp"

</script>
<% } %>
<script type="text/javascript">
	function heartCheck() {
		<% if(memberHartnum < 1){ %>
		   		alert("하트 개수가 부족합니다. 확인해주세요.");
				location.href="/Spectrum/myPageDetail.do";
				return false;
		<%} else { %>
			    return true;
		<%}  %>
	}
	
	
	
</script>
<style type="text/css">
body {
	text-align: center;
}
#card{
	max-width: 40rem;
    left: 50%;
    top: 40%;
    position: absolute;
    transform: translate(-50%, -50%);
  }
  .btn-lg{
  margin-top: 1.5rem
  }
  h1{
  padding: 0.7rem;
	margin-bottom: 0;
  }
</style>
<title>MBTI 1:1 채팅</title>
</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>
	<h1> MBTI 1:1 채팅 </h1>
<div class="card border-primary mb-3" id="card">
  <div class="card-header">1:1 랜덤 채팅</div>
  <div class="card-body">
    <h4 class="card-title">채팅하고 싶은 MBTI유형을 선택해주세요</h4>
    <p class="card-text">채팅 요청시 하트가 1개 소모됩니다, 신중히 선택해주세요.</p>
    <form action="<%=request.getContextPath()%>/mbtiPrivateChatWaiting" method="post">
	<div class="form-group">
     <select class="form-select" name="chatMbtiSelect" id="chatMbtiSelect">
       <option>ENTJ</option>
       <option>ENTP</option>
       <option>ENFP</option>
       <option>ENFJ</option>
       <option>ESTP</option>
       <option>ESTJ</option>
       <option>ESFP</option>
       <option>ESFJ</option>
       <option>INTP</option>
       <option>INTJ</option>
       <option>INFP</option>
       <option>INFJ</option>
       <option>ISTP</option>
       <option>ISTJ</option>
       <option>ISFP</option>
       <option>ISFJ</option>
     </select>
   </div>
   <div class="d-grid gap-2">
   <input type="submit" value="채팅요청" class="btn btn-outline-primary btn-lg" onclick="heartCheck()">
   </div>
   </form>
  </div>
</div>
	
</body>
</html>
