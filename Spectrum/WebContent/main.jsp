
<%@page import="java.util.List"%>
<%@page import="spectrum.blacklist.vo.BlacklistVO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="spectrum.blacklist.service.BlacklistServiceImpl"%>
<%@page import="spectrum.blacklist.service.IBlacklistService"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String memberId=(String)session.getAttribute("memberId");
	String adminId=(String)session.getAttribute("adminId");
	String mbtiCode=(String)session.getAttribute("mbtiCode");
	
	//나
	//블랙리스트(날짜 지나면 풀리는 메소드) - 머지할때 보세요! 
	// 1. 서비스 객체 생성하기
	IBlacklistService blackService = BlacklistServiceImpl.getInstance();

	// 2. 회원정보 조회
	List<BlacklistVO> blackList = blackService.getALLBlackList();
	blackList = blackService.getALLBlackList();

	LocalDate date = LocalDate.now();
	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	String today = date.format(dateTimeFormatter);

	int blackSize = blackList.size();
	if (blackSize > 0) {
		for (int i = 0; i < blackSize; i++) {

			if (blackList.get(i).getBlacklistReleasedate().substring(0, 10).equals(today)) {

				blackService.deleteBlacklist(blackList.get(i).getBlacklistNumber());
				blackList = blackService.getALLBlackList();
			}
		}
	}
	
	
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>스펙트럼</title>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="jquery-3.6.0.min.js"></script>

<script src="https://kit.fontawesome.com/ff142f0d18.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<style>
#carouselExampleControls{
      margin-left: 20%;
    margin-right: 20%;
    margin-top: 100px;
    margin-bottom: 30px;
} 
.navbar{
position: fixed;
    top: 0;
    width: 100%;
    padding: 0.7rem;
    z-index:1;
} 
 
</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/Spectrum/main.jsp"><i class="fab fa-sketch"></i>스펙트럼</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
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
        if(memberId!=null){
        	 %>	
        	 
        <li class="nav-item">
          <a class="nav-link" href="/Spectrum/mySpectrumList.do">마이 스펙트럼</a>
        </li>
         <%
        }
        %>
        
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
         
         
         <%
         
        }
         %>      
      </ul>
    </div>
  </div>
</nav>


<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <a href="/Spectrum/mbtiSurvey/basicSurvey.do"><img src="<%=request.getContextPath()%>/imeges/mbtimain.png" class="d-block w-100 img-fluid" alt="..."></a>
        </div>
        <div class="carousel-item">
          <img src="<%=request.getContextPath()%>/imeges/mbtimain2.png" class="d-block w-100 img-fluid" alt="...">
        </div>
        <div class="carousel-item">
          <img src="<%=request.getContextPath()%>/imeges/mbtimain3.png" class="d-block w-100 img-fluid" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>


<div id="fameboard" style="padding: 20%;
    padding-top: 20px;">



</div>

<script type="text/javascript">
$(document).ready(function(){

  $.ajax({
          type : 'get'
         ,url : 'fameboard.jsp'      //요청
         ,dataType : 'html'         //응답(필수)
         ,success : function(data){
           $('#fameboard').html(data);
         }   //응답(필수)
         ,error : function(xhr){
            alert("상태 >> " + xhr.status);
         }                  //응답(필수)
         });
        });


</script>
  



</body>


</html>