<%@page import="spectrum.mbtiSurvey.vo.MbtiSurveyVO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% 
	String memberId2=(String)session.getAttribute("memberId");
    List<MbtiSurveyVO> surveyList = (List<MbtiSurveyVO>) request.getAttribute("surveyList");
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성격유형검사</title>

<% if(memberId2 == null){ %>
<script>

  alert("로그인 후 이용가능합니다.");
  history.go(-1);

</script>
<% } %>
<script>
	function Checkform() {
    const AllFormElements = window.document.getElementById("survey").elements;
    for (i = 0; i < AllFormElements.length; i++)
    {
        if (AllFormElements[i].type == 'radio')
        {
            let ThisRadio = AllFormElements[i].name;
            let ThisChecked = 'No';
            const AllRadioOptions = document.getElementsByName(ThisRadio);
            for (x = 0; x < AllRadioOptions.length; x++)
            {
                 if (AllRadioOptions[x].checked && ThisChecked == 'No')
                 {
                     ThisChecked = 'Yes';
                     break;
                 }
            }
            if (ThisChecked == 'No'){
				AllFormElements[i].focus();
				alert('모든 문항을 선택해주세요.');
				return false;
			}
        }
    }
    return true;
}
</script>
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
h1{
margin-top: 0;
margin-bottom: 0;
padding: 1.2rem;
}
body{
text-align: center;
}
#tip{
display: flex;
}
.thumbnail > img{
height: 10rem;
}
.body-div{
padding-top: 50px;
}
</style>
</head>

<body>
	<div>
    <%@include file="/navbar.jsp" %>
</div>
<div class="body-div">
	<header>

		<h1>무료 성격유형검사</h1>

	</header>
	<div id="tip">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="https://static.neris-assets.com/images/test-header-1.svg" alt="...">
      <div class="caption">
        <h5>총 검사 시간은 8분 내외입니다.</h5>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="https://static.neris-assets.com/images/test-header-2.svg" alt="...">
      <div class="caption">
        <h5>혹 질문이 마음에 들지 않더라도 솔직하게 답변하십시오.</h5>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="https://static.neris-assets.com/images/test-header-3.svg" alt="...">
      <div class="caption">
        <h5>가능하면 답변 시 '중립'을 선택하지 마십시오.</h5>
      </div>
    </div>
  </div>
</div>

<form id="survey" name="survey" action="basicSurvey.do" method="post" onSubmit="return Checkform()">
		<%
		 int surveyListSize = surveyList.size();
		if(surveyListSize > 0){
			for(int i=0; i<surveyListSize; i++){
		%>
		<div class="card">
  <div class="card-body">
    <h5 class="card-title"><%= surveyList.get(i).getMbtiSurveyContent() %></h5>
    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn1" value="10" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn1">매우 동의</label>

  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn2" value="8.3" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn2">거의 동의</label>

  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn3" value="6.6" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn3">약간 동의</label>

  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn4" value="5" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn4">중간</label>

  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn5" value="3.3" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn5">약간 비동의</label>

  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn6" value="1.6" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn6">거의 비동의</label>

  <input type="radio" class="btn-check" name="<%= surveyList.get(i).getMbtiSurveyNumber() %>" id="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn7" value="0" autocomplete="off">
  <label class="btn btn-secondary" for="<%= surveyList.get(i).getMbtiSurveyNumber() %>btn7">매우 비동의</label>
</div>
  </div>
</div>
		
		<%
			}
		}else{
		%>
	<p>페이지 오류</p>
		<%
		}
		%>

	
	<div class="d-grid gap-2 col-6 mx-auto" style="padding: 1%;">
	<input type="submit" value="검사 결과 보기" class="btn btn-primary btn-lg">
		</div>
	</form>
	
</div>

</body>

</html>