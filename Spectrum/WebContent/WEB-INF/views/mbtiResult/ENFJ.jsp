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
<title>ENFJ</title>
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
  <h3 class="card-header text-center">"ENFJ" “정의로운 사회운동가” "언변능숙형"</h3>
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
            <p class="col">직관</p>
            <p class="col text-end">감각</p>
        </div>
        </div>
      <div class="progress">
          <div class="progress-bar bg-info" role="progressbar" style="width: <%=mbtiIndicatorsN%>%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="container">
          <div class="row">
            <p class="col"><%=mbtiIndicatorsN%>%</p>
            <p class="col text-end"><%=mbtiIndicatorsS%>%</p>
        </div>
        </div>
  </div>
  <div class="card-body">
      <h5 class="card-title text-center">판단의 근거</h5>
      <div class="container">
          <div class="row">
            <p class="col">감정</p>
            <p class="col text-end">사고</p>
        </div>
        </div>
      <div class="progress">
          <div class="progress-bar bg-warning" role="progressbar" style="width: <%=mbtiIndicatorsF%>%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="container">
          <div class="row">
            <p class="col"><%=mbtiIndicatorsF%>%</p>
            <p class="col text-end"><%=mbtiIndicatorsT%>%</p>
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
    <p>당신이 현재하는 사소한 행위는 잔잔한 물결처럼 서서히 퍼져나가 모든 이에게 영향을 줍니다.<br>당신의 마음가짐이 다른 이의 가슴에 불을 지필 수도, 근심을 초래할 수도 있습니다. <br>당신의 숨소리가 사랑의 빛을 뿜어낼 수도, 우울함으로 온 방안을 어둡게 만들 수도 있습니다.<br> 당신의 시선이 즐거움을 선사할 수도 있으며, 당신의 언어가 자유를 향한 열망을 독려할 수도 있습니다.<br> 당신의 행동 하나하나가 다른 이들의 생각과 마음을 열 수 있습니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    DAVID DEIDA <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    사회운동가형 사람은 카리스마와 충만한 열정을 지닌 타고난 리더형입니다. 인구의 대략 2%가 이 유형에 속하며, 정치가나 코치 혹은 교사와 같은 직군에서 흔히 볼 수 있습니다. 이들은 다른 이들로 하여금 그들의 꿈을 이루며, 선한 일을 통하여 세상에 빛과 소금이 될 수 있도록 사람들을 독려합니다. 또한, 자신뿐 아니라 더 나아가 살기 좋은 공동체를 만들기 위해 사람들을 동참시키고 이끄는 데에서 큰 자부심과 행복을 느낍니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/diplomats_Protagonist_ENFJ_introduction.png" class="img-fluid" alt="diplomats_Protagonist_ENFJ">
<br>

<h3>진심으로 사람을 믿고 이끄는 지도자</h3>
<p class="lead">
  우리는 대개 강직한 성품을 가진 이에게 마법처럼 끌리곤 합니다. 사회운동가형 사람은 진정으로 타인을 생각하고 염려하며, 그들이 필요하다고 느낄 때면 발 벗고 나서서 옳은 일을 위해 쓴소리하는 것을 마다하지 않습니다. 다른 이들과 별 어려움 없이 잘 어울리며, 특히 사람들과 직접 얼굴을 보고 의사소통하는 것을 좋아합니다. 이들에게 내재되어 있는 직관적 성향은 이성적 사실이나 정제되지 않은 인간의 본래 감정을 통하여 다양한 사람의 성격을 더 잘 파악하고 이해하게 합니다. 타인의 의도나 동기를 쉽게 파악 후 이를 그와 개인적으로 연관 짓지 않으며, 대신 특유의 설득력 있는 웅변 기술로 함께 추구해야 할 공통된 목표를 설정하여 그야말로 최면에 걸린 듯 사람들을 이끕니다.
</p>
<p class="lead">
  진심으로 마음에서 우러나 타인에게 관심을 보이는 이들이지만 간혹 도가 지나쳐 문제가 될 때도 있습니다. 일단 사람을 믿으면 타인의 문제에 지나치리만치 관여하는 등 이들을 무한 신뢰하는 경향이 있습니다. 다행히도 이들의 진심 어린 이타주의적 행동은 다른 이들로 하여금 더 나은 사람이 될 수 있도록 독려한다는 차원에서 자기 계발을 위한 자아실현 기제로 작용하기도 합니다. 하지만 자칫 잘못하면 이들의 지나친 낙관주의는 되려 변화를 모색하는 이들의 능력 밖이거나 그들이 도울 수 있는 범주를 넘어서는 일이 될 수도 있습니다.
</p>
<p class="lead">
  사회운동가형 사람이 경험할 수 있는 또 다른 오류는 이들이 그들 자신 감정을 지나치게 투영하고 분석한다는 점입니다. 다른 사람의 문제에 지나치리만치 깊이 관여하는 경우, 자신의 잘못에서 비롯된 일이 아님에도 불구하고 타인의 문제를 마치 본인의 문제로 여겨 자칫하면 정서적 심기증(hypochondria)과 같은 증상을 보일 수도 있습니다. 더욱이 타인이 문제를 해결하는 데 한계에 도달하였을 때 이를 해결하는 데 자신이 어떠한 도움이 될 수 없음에 딜레마에 빠지기도 합니다. 이러한 오류를 범하지 않기 위해서는 사회운동가형 사람은 그 상황에서 한발 뒤로 물러나 본인이 느끼는 감정과 타인의 문제를 객관적으로 분리해 다른 각도에서 바라볼 필요가 있습니다.
</p>
<br>

<h3>사회정의 구현을 위해 어려움에 맞서 싸우는 이들</h3>
<blockquote class="blockquote">
  <p>
    사회운동가형 사람은 말과 행동이 일치하며, 타인을 진심으로 대합니다. 중독성 강한 이들 특유의 열정으로 사람들 간의 화합을 도모하고 변화를 이끌 때 이들은 그 어떤 때보다도 큰 행복을 느낍니다.
  </p>
</blockquote>
<p class="lead">
  사회운동가형의 과도한 이타주의적 성격은 자칫하면 되레 문제를 야기하기도 합니다. 이들은 그들이 옳다고 믿는 생각이나 이념 실현을 위해 다른 이를 대신하여 총대를 메는 것을 두려워하지 않습니다. 이를 볼 때 다수의 영향력 있는 정치인이나 지도자가 이 유형에 속하는 것이 어찌 보면 당연한지도 모릅니다. 경제적 부를 창출하기 위해 나라를 이끄는 한 국가의 원수에서부터 버거운 경기를 승리로 이끄는 어린이 야구팀 코치에 이르기까지 이들은 더 밝은 미래 구현을 위해 앞장서서 사람들을 이끄는 것을 좋아합니다.
</p>
<br>
</div>
</body>
</html>