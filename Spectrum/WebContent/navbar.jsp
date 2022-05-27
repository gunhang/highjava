<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId=(String)session.getAttribute("memberId");
	String adminId=(String)session.getAttribute("adminId");
%>

<html>
<head>
<script src="https://kit.fontawesome.com/ff142f0d18.js" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: fixed; top: 0;  width: 100%; padding: 0.7rem; z-index:1;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/Spectrum/main.jsp"><i class="fab fa-sketch"></i>스펙트럼</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        <li class="nav-item">
          <a class="nav-link" href="/Spectrum/anonyboard/anonylist">익명게시판</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	I게시판
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=INTP">INTP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=INTJ">INTJ</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=INFP">INFP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=INFJ">INFJ</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ISTP">ISTP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ISTJ">ISTJ</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ISFP">ISFP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ISFJ">ISFJ</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	E게시판
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ENTJ">ENTJ</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ENTP">ENTP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ENFP">ENFP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ENFJ">ENFJ</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ESTP">ESTP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ESTJ">ESTJ</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ESFP">ESFP</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiboard/mbtiboardlist?mbtiBoard=ESFJ">ESFJ</a></li>
          </ul>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	관리 게시판
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="<%=request.getContextPath() %>/board/noticelist.do">공지사항</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath() %>/board/questionlist.do">Q&A</a></li>
          </ul>
        </li>
        <%
        if(memberId==null&&adminId==null){
        %>
        
        
        <li class="nav-item">
          <a class="nav-link" href="/Spectrum/member/memberjoin.do">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Spectrum/member/insert.do">회원가입</a>
        </li>
        
        
        
        <%
        }else if(memberId!=null||adminId!=null){
        %>
        
        <li class="nav-item">
          <a class="nav-link" href="/Spectrum/mySpectrumList.do">마이 스펙트럼</a>
        </li>
        	<li class="nav-item">
          <a class="nav-link" href="/Spectrum/mbtiGroupMutiChat.jsp">MBTI그룹채팅</a>
        </li> 
        	<li class="nav-item">
          <a class="nav-link" href="/Spectrum/mbtiPrivateChatWaiting">MBTI 1:1채팅</a>
        </li> 
     		<li class="nav-item">
          <a class="nav-link" href="/Spectrum/member/insertPayment.do" 
          onclick="window.open(this.href, '_blank', 'width=1000, height=700, left=450, top=150,toolbars=no,scrollbars=no'); return false;">결제</a>
        </li>      
       
     		<li class="nav-item">
         <a class="nav-link" href="/Spectrum/mbtiSurvey/basicSurvey.do">MBTI 검사</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link" href="/Spectrum/member/logout.do">로그아웃</a>
        </li>
        
         <%
        }if(adminId!=null){
        	
        
        
        
         %>
         
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	관리자
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Spectrum/mbtiSurvey/list.do">mbti검사문항관리</a></li>
            <li><a class="dropdown-item" href="/Spectrum/mbtiResult/list.do">mbti검사결과관리</a></li>
            <li><a class="dropdown-item" href="/Spectrum/rank/ranklist.do">등급관리</a></li>
            <li><a class="dropdown-item" href="/Spectrum/admin/adminlist.do">관리자페이지</a></li>
            <li><a class="dropdown-item" href="/Spectrum/report/reportlist.do">신고관리</a></li>
            <li><a class="dropdown-item" href="/Spectrum/blacklist/blacklistlist.do">블랙리스트</a></li>
            <li><a class="dropdown-item" href="/Spectrum/sale/salelist.do">매출조회</a></li>
          </ul>
        </li>
         
         
         <%
         
        }
         %>      
      </ul>
    </div>
  </div>
</nav>


</body>
</html>