<%@page import="spectrum.mbtiResult.vo.MbtiResultVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MbtiResultVO mbtiResultVO = (MbtiResultVO) request.getAttribute("mbtiResultVO");
    int mbtiIndicatorsE = (int) Math.round(Double.parseDouble(mbtiResultVO.getMbtiIndicatorsEI()));
    int mbtiIndicatorsI = (int) Math.round(100 - mbtiIndicatorsE);
    int mbtiIndicatorsS = (int) Math.round(Double.parseDouble(mbtiResultVO.getMbtiIndicatorsSN()));
    int mbtiIndicatorsN = (int) Math.round(100 - mbtiIndicatorsS);
    int mbtiIndicatorsT = (int) Math.round(Double.parseDouble(mbtiResultVO.getMbtiIndicatorsTF()));
    int mbtiIndicatorsF = (int) Math.round(100 - mbtiIndicatorsT);
    int mbtiIndicatorsJ = (int) Math.round(Double.parseDouble(mbtiResultVO.getMbtiIndicatorsJP()));
    int mbtiIndicatorsP = (int) Math.round(100 - mbtiIndicatorsJ);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ESTJ</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
  .row > p{
      margin-top: 0.4rem;
      margin-bottom: 0.4rem;
  }

  .card{
  max-width: 60rem;
  left: 50%;
  top: 60%;
  position: absolute;
  transform: translate(-50%, -50%);
  }
  .card-title{
    margin-bottom: 0;
  }

  body{
margin-top: 1000px;
  }
</style>
</head>
<body>
<div style="position: absolute; top: 0;  width: 100%;">
    <%@include file="/navbar.jsp" %>
</div>
<div class="card mb-3">
  <h3 class="card-header text-center">"ESTJ" “엄격한 관리자” "사업가형"</h3>
  <div class="card-body">
      <h5 class="card-title text-center">에너지의 방향</h5>
      <div class="container">
        <div class="row">
          <p class="col">외향</p>
          <p class="col text-end">내향</p>
      </div>
      </div>
      <div class="progress">
          <div class="progress-bar bg-success" role="progressbar" style="width: <%=mbtiIndicatorsE%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="container">
          <div class="row">
             <p class="col"><%=mbtiIndicatorsE%>%</p>
            <p class="col text-end"><%=mbtiIndicatorsI%>%</p>
        </div>
        </div>
  </div>
  <div class="card-body">
      <h5 class="card-title text-center">사람이나 사물을 인식하는 방식</h5>
      <div class="container">
          <div class="row">
            <p class="col">감각</p>
            <p class="col text-end">직관</p>
        </div>
        </div>
      <div class="progress">
          <div class="progress-bar bg-info" role="progressbar" style="width: <%=mbtiIndicatorsS%>%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="container">
          <div class="row">
            <p class="col"><%=mbtiIndicatorsS%>%</p>
            <p class="col text-end"><%=mbtiIndicatorsN%>%</p>
        </div>
        </div>
  </div>
  <div class="card-body">
      <h5 class="card-title text-center">판단의 근거</h5>
      <div class="container">
          <div class="row">
            <p class="col">사고</p>
            <p class="col text-end">감정</p>
        </div>
        </div>
      <div class="progress">
          <div class="progress-bar bg-warning" role="progressbar" style="width: <%=mbtiIndicatorsT%>%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="container">
          <div class="row">
            <p class="col"><%=mbtiIndicatorsT%>%</p>
            <p class="col text-end"><%=mbtiIndicatorsF%>%</p>
        </div>
        </div>
  </div>
  <div class="card-body">
  <h5 class="card-title text-center">선호하는 삶의 패턴</h5>
  <div class="container">
      <div class="row">
        <p class="col">판단</p>
        <p class="col text-end">인식</p>
    </div>
    </div>
  <div class="progress">
      <div class="progress-bar bg-danger" role="progressbar" style="width: <%=mbtiIndicatorsJ%>%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
  </div>
  <div class="container">
      <div class="row">
        <p class="col"><%=mbtiIndicatorsJ%>%</p>
        <p class="col text-end"><%=mbtiIndicatorsP%>%</p>
    </div>
    </div>
    </div>
  <div class="card-footer text-muted">
      간략한 검사의 결과로 검사결과의 정확도는 보장되지 않습니다.
  </div>
</div>

<div class="container">
<figure class="text-center">
  <blockquote class="blockquote">
    <p>훌륭한 질서는 모든 것의 기초이다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    EDMUND BURKE <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    관리자형 사람은 그들 생각에 반추하여 무엇이 옳고 그른지를 따져 사회나 가족을 하나로 단결시키기 위해 사회적으로 받아들여지는 통념이나 전통 등 필요한 질서를 정립하는 데 이바지하는 대표적인 유형입니다. 정직하고 헌신적이며 위풍당당한 이들은 비록 험난한 가시밭길이라도 조언을 통하여 그들이 옳다고 생각하는 길로 사람들을 인도합니다. 군중을 단결시키는 데에 일가견이 있기도 한 이들은 종종 사회에서 지역사회조직가와 같은 임무를 수행하며, 지역 사회 발전을 위한 축제나 행사에서부터 가족이나 사회를 하나로 결집하기 위한 사회 운동을 펼치는 데 사람들을 모으는 역할을 하기도 합니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/sentinels_Executive_ESTJ_introduction.png" class="img-fluid" alt="sentinels_Executive_ESTJ">
<br>

<h3>옳다고 생각되는 일은 거침없이 밀고 나가는 굳은 의지!</h3>
<p class="lead">
  특히 민주주의 사회에서 더욱 필요로 하는 이 유형의 사람은 인구의 대략 11%를 차지합니다. 전 세계 유명 비즈니스 리더나 정치인 중 상당수가 이 유형에 속하는 것이 어찌 보면 그리 놀랍지 만은 않을 것입니다. 법과 사회 질서의 중요함을 굳게 믿는 이들은 헌신과 공명정대한 삶을 통해 다른 이들에게 본보기가 되고자 하는데, 특히 업무적으로 게으르거나 부정을 저지르는 이들은 가차 없이 벌하기도 합니다. 만일 누군가 고되고 힘든 사회 운동을 자처하여 그들의 됨됨이를 증명해 보이고자 하는 이들이 있다면 이들은 바로 관리자형 사람일 것입니다.
</p>
<p class="lead">
  이들은 주변 상황을 잘 판단하여 명확하고 증명이 가능한 확실한 사실에 근거하여 사고하는 경향이 있습니다. 이리하여 만일 이들의 의견이나 결정 내린 사항이 심한 반대 의견에 부딪혔을 때 이들로 하여금 무엇이 가능하고 불가능한지를 정확히 판단하여 본연의 믿음이나 생각을 고수한 채 꿋꿋이 헤쳐나갈 수 있게 합니다. 말을 허투루 하지 않는 이들은 성취하기 어려운 고된 일도 마다치 않고 기꺼이 뛰어들어 구체적으로 실행 계획을 세워 난해해 보이는 일도 수월히 실행해 나갑니다.
</p>
<p class="lead">
  나아가 이들은 업무를 수행하는 데 있어 그들의 엄격한 가치관이 함께 일하는 다른 이들에게도 반영되기를 원합니다. 기본적으로 사람들과의 약속을 충실히 이행하는 이들의 기본 성향 때문에 함께 일하는 동업자나 부하의 무능력함, 태만, 심지어는 부정직함으로 이들을 시험에 들게 하는 경우 심한 불호령도 마다하지 않습니다. 이 때문에 종종 융통성 없는 성격으로 비추어지기도 하지만, 이는 이들의 성격이 외골수여서가 아니라 이것들이 건강한 사회 건설을 위하여 지켜져야 할 중요한 덕목이라고 굳게 믿기 때문입니다.
</p>
<br>

<h3>부족함을 인정할 줄 아는 지혜</h3>
<blockquote class="blockquote">
  <p>
    법질서를 준수하고 이웃을 도우며 지역 사회나 조직 발전을 위해 타인의 동참을 유도하는 관리자형 사람은 전형적인 모범시민이라고 할 수 있습니다.
  </p>
</blockquote>
<p class="lead">
  단, 이들이 명심해야 할 한 가지 사항은 모든 이들이 그들과 같은 노력을 기울이며 동일한 길을 가지는 않는다는 것입니다. 진정한 리더의 역할은 그룹 혹은 개개인의 장점을 잘 살펴 그들의 생각을 마음껏 펼칠 수 있도록 돕는 데 있습니다. 만일 이러한 이들의 노력이 선행된다면 모든 필요한 자질과 사실을 가지고 모든 이가 원하는 방향으로 이들을 통솔할 수 있을 것입니다.
</p>
<br>
</div>
</body>
</html>