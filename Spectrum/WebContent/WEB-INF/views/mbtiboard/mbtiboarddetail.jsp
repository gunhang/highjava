<%@page import="spectrum.board.atch.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.mbtiboard.report.vo.MbtiBoardReportVO"%>
<%@page import="spectrum.mbtiboard.report.service.MbtiBoardReportService"%>
<%@page import="spectrum.mbtiboard.recommend.vo.MbtiBoardRecommendVO"%>
<%@page import="spectrum.mbtiboard.recommend.service.MbtiBoardRecommendService"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MbtiBoardVO mv = (MbtiBoardVO) request.getAttribute("mv");
	String content=null;
	 String reqId= mv.getmemberId();
	if(mv.getmbtiboardContent()!=null){
		content=mv.getmbtiboardContent().replace("\r\n","<br>");
	}
	String memId=(String)session.getAttribute("memberId");
	if(memId==null){
		memId="";
	}
	List<AtchFileVO> atchFileList =(List<AtchFileVO>)request.getAttribute("atchFileList");
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스펙트럼</title>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="../jquery-3.6.0.min.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>
<body>

<div id="header">
	 <%@include file="/navbar.jsp" %>
</div>
<div id="detailPadding"></div>


<div class="card">
  <div class="card-header text-center">
   <small class="text-muted" style="display: grid;"><%=mv.getmbtiboardTypecode() %></small> <%=mv.getmbtiboardTitle()%>
  </div>
  <div class="card-body">
    <p class="card-title text-end">작성자 : <%=mv.getMemberNickname() %></p>
    <p class="card-text"><%=content%></p>
			
			<%	if (atchFileList != null) {%>
					<div class="card-body">
			<%		for (AtchFileVO fileVO : atchFileList) {%>

				<a href="<%=request.getContextPath()%>/mbtiboard/mbtidownload?fileId=<%=fileVO.getBoardAttachmentId()%>&fileSn=<%=fileVO.getBoardatcdtlNum()%> " class="card-link"><%=fileVO.getBoardatcdtlOriginalname()%></a>

			<%	}  %>
			</div>
			<%	}  %>

			<div class="row" style="justify-content: space-around; ">
				<a href="mbtiboardlist?mbtiBoard=<%=mv.getmbtiboardClassificationcode() %>" class="btn btn-secondary" style="width: auto;">목록</a>
				<%
					if (mv.getmemberId().equals(memId)) {
				%>
				<a href="mbtiboardupdate?mbtiboardPostnum=<%=mv.getmbtiboardPostnum()%>"
					class="btn btn-outline-danger" style="width: auto;">수정</a> 
				<a href="mbtiboarddelete?mbtiboardPostnum=<%=mv.getmbtiboardPostnum()%>&mbtiBoard=<%=mv.getmbtiboardClassificationcode()%>"
					class="btn btn-outline-danger" style="width: auto;">삭제</a>
				<% } %>
			</div>
		</div>
  <div class="card-footer text-muted">
    <%=mv.getmbtiboardDate().substring(0, 16)%>
  </div>
</div>


<!-- 신고 -->
	<%
		MbtiBoardReportVO reportVO= new MbtiBoardReportVO();
		reportVO.setMbtiboardPostnum(mv.getmbtiboardPostnum());
		reportVO.setMemberId(mv.getmemberId());
		String reportCheck=MbtiBoardReportService.getInstance().reportCheck(reportVO);
		if(reportCheck==null){
	
	%>
	
	<div class="accordion accordion-flush">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        신고
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
			<div id="report" style="width: auto;  margin-bottom: 35px;">
			<form action="reportinsert" method="post" style="display: grid;">
			<input type="hidden" value="<%=mv.getmbtiboardPostnum()%>" name="mbtiBoardNum">
			<input type="hidden" value="<%=mv.getmemberId()%>" name="memberId"> 
			<input type="hidden" value="<%=mv.getmbtiboardClassificationcode()%>" name="mbti"> 
			<textarea rows="3" cols="130" name="textarea"></textarea>
			<button type="submit" class="btn btn-outline-primary position-relative" style="margin-bottom: 30px;">신고</button>
			</form>
			</div>
      </div>
    </div>
  </div>
  </div>
	<%
	}
	%>


<div class="row" style="justify-content: center;  padding: 20px;">
	
	
	<!-- 추천 -->
	<div id ="rebutton" style="width: fit-content;">
		<%
		
			MbtiBoardRecommendVO mrv = new MbtiBoardRecommendVO();
			mrv.setMbtiboardPostnum(mv.getmbtiboardPostnum());
			mrv.setMemberId(mv.getmemberId());
				
				
		 	String yN=MbtiBoardRecommendService.getInstance().recommendYn(mrv);
		    if(yN==null){
		 %>
				<form action="recommendinsert" method="post">
		<%
		    }else if(yN.equals("Y")){
		%>
				<form action="recommendupdate" method="post">
				<input type="hidden" value="N" name="yN">
		
		<%     	
		    }else if(yN.equals("N")){
		%>
		  		<form action="recommendupdate" method="post">
		  		<input type="hidden" value="Y" name="yN"> 
		<%    
		    }
			
		%>
			<input type="hidden" value="<%=mv.getmbtiboardPostnum()%>" name="mbtiBoardNum">
			<input type="hidden" value="<%=mv.getmemberId()%>" name="memberId">
			<button type="submit" class="btn btn-primary position-relative">
			  추천
			 
			  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
			    <%=MbtiBoardRecommendService.getInstance().getRecommend(mv.getmbtiboardPostnum())%>
			    
			  <span class="visually-hidden">unread messages</span>
			  </span>
		</form>
	</div>
	
	<div style="width: fit-content;">
			<button type="submit" class="btn btn-primary" name="requestId" id="friend" >CONNECT</button>
	</div>
	
</div>

	<div id="boardre"></div>
	
	</div>
	
<%
if(memId!=""){

%>	
<div class="card" style="margin: 20%;
    margin-top: 10px;
    margin-bottom: 0;">
  <div class="card-header">
    댓글 등록
  </div>
  <ul class="list-group list-group-flush">
  	<li class="list-group-item row">
  		<form action="/Spectrum/mbtiboard/mbtiboardreinsert" method="post" style="display: grid;">
  			<input type="hidden" name ="mbti" value="<%=mv.getmbtiboardClassificationcode()%>" >
			<input type="hidden" name ="mbtiBoardNum" value="<%=mv.getmbtiboardPostnum()%>" >
			<input type="hidden" name ="memberId" value="<%=memId %>">
			<textarea name="mbtiboardContent" rows="3" cols="100" class="form-control"></textarea>
			<input type="submit" value="댓글 등록" class="btn btn-outline-success">
		</form>
  	</li>
  </ul>
</div>

<%
}
%>	

	

	
<script type="text/javascript">
$(document).ready(function(){

  $.ajax({
          type : 'get'
         ,url : "/Spectrum/mbtiboard/mbtiboardrelist"      //요청
         ,dataType : 'html'  
        	 ,data : {mbtiBoardNum : "<%=mv.getmbtiboardPostnum()%>"}//응답(필수)
         ,success : function(data){
           $('#boardre').html(data);
         }   //응답(필수)
         ,error : function(xhr){
            alert("상태 >> " + xhr.status);
         }                  //응답(필수)
         });
        });


</script>	
<script type="text/javascript">

$("#friend").click(function(){

	  $.ajax({
	          type : 'get'
	         ,url : "/Spectrum/friendinsert.jsp"      //요청
	         ,dataType : 'html'  
	         ,data : {requestId : "<%=mv.getmemberId()%>"}  //응답(필수)
	         ,success : function(data){
	        	 alert("성공 " );
	         }   //응답(필수)
	         ,error : function(xhr){
	            alert("상태 >> " + xhr.status);
	         }                  //응답(필수)
	         });
	        });
</script>
	
	
</body>
</html>