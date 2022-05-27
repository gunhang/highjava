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
<title>ENTJ</title>
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
  <h3 class="card-header text-center">"ENTJ" “대담한 통솔자" "지도자형"</h3>
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
    <p>당신에게 주어진 시간은 한정되어 있습니다. 그러니 다른 이의 삶을 사느라 시간을 낭비하지 마세요.<br> 다른 사람의 생각에서 빚어진 삶에 방식에 맞추는 함정에 빠지지 마세요. 다른 사람들이 내는 의견이나 생각이 당신의 목소리에 귀 기울이는 것을 방해하는 소음이 되지 않게 하세요.<br> 그리고 무엇보다 중요한 것은, 당신의 마음과 직관을 굳건히 믿고 따라갈 수 있는 용기를 가지는 것입니다.<br> 당신이야말로 당신이 진정으로 원하는 것이 무엇인지 정확히 알고 있기 때문입니다. 그 외 다른 것은 모두 부차적일 뿐입니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    STEVE JOBS <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    통솔자형 사람은 천성적으로 타고난 리더입니다. 이 유형에 속하는 사람은 넘치는 카리스마와 자신감으로 공통의 목표 실현을 위해 다른 이들을 이끌고 진두지휘합니다. 예민한 성격의 사회운동가형 사람과 달리 이들은 진취적인 생각과 결정력, 그리고 냉철한 판단력으로 그들이 세운 목표 달성을 위해 가끔은 무모하리만치 이성적 사고를 하는 것이 특징입니다. 이들이 인구의 단 3%에 지나지 않는 것이 어쩌면 다행일 수도 있습니다. 그렇지 않으면 인구 대다수를 차지하는 소심하고 섬세한 성향의 사람들이 모두 주눅 들어 살지도 모르니까요. 단, 평소 잊고 살기는 하나 우리 삶을 윤택하게 해주는 위대한 사업가나 기관을 이끄는 통솔자형 사람들이 있음에 다행이기도 합니다.
</p>
<h3>‘성취’를 통해 느끼는 행복</h3>
<p class="lead">
  통솔자형 사람은 크든 작든 성취 가능한 도전에 매력을 느낍니다. 이들은 충분한 시간과 자원만 있으면 그 어떤 것도 실현 가능하다고 믿습니다. 이것이 통솔자형 사람을 뛰어난 사업가로 만드는 이들만의 성격적 자질로, 전략적인 사고와 장기적인 안목과 더불어 빠른 판단력과 정확성으로 계획을 단계별로 실행해 나감으로써 진정한 리더의 역할을 합니다. 보통의 사람이라면 포기하고 말 일들도 대단한 의지력으로 꾸준히 밀어붙이는데, 이는 이들에게 있어 자아실현을 위한 자기 암시이기도 합니다. 또한 뛰어난 사회성을 발휘하여 다른 동료들을 채찍질함으로써 함께 더 큰 성공과 성취를 이루고자 합니다.
</p>
<img src="<%=request.getContextPath()%>/analysts_Commander_ENTJ_introduction.png" class="img-fluid" alt="analysts_Commander_ENTJ">
<p class="lead">
  기업 관련 협상이든, 자동차 구매를 위한 협상이든 통솔자형 사람은 우위를 선점한 채 한 치도 뒤로 물러서는 법이 없습니다. 이는 단순히 이들이 냉혈인이라거나 사악해서가 아니라 단지 도전과 지략, 그리고 상황에서 행해지는 상대방과의 재담(才談)을 진정 즐기기 때문입니다. 만일 상대가 게임이 안된다 하더라도 이는 통솔자형 사람으로 하여금 승리로 이끄는 핵심 전략서를 스스로 덮게 만드는 이유가 되지 못합니다.
</p>
<blockquote class="blockquote">
  <p>
    "내가 상대방을 배려할 줄 모르는 '미친 X'이라고 해도 난 신경 안 써. 왜냐하면 난 잘난 '미친 X'이니까"라는 생각이 이들의 속마음입니다.
  </p>
</blockquote>
	<p class="lead">
    통솔자형 사람이 우러러보는 누군가가 있다면 그는 아마도 그들 자신처럼 정확하고 민첩하게 행동하는 사람으로, 지식으로 무장하여 그들에게 감히 도전장을 내미는 사람일 것입니다. 이들은 다른 사람의 재능을 알아보는 재주 또한 있는데, 이는 팀원 간의 협력을 다지고(아무리 잘나고 똑똑한 개인이라도 모든 일을 혼자 다 할 수는 없으므로) 이들의 오만방자함을 견제하는 데 도움이 됩니다. 간혹 혹독하리만치 타인의 실수를 지적하는 경향이 있는데 이로 인해 이들은 종종 문제를 야기하기도 합니다.
</p>
<br>

<h3>진정성 있는 인간관계 형성을 위한 노력</h3>
<p class="lead">
  분석형에 속하는 사람들은 감정을 표현하는 일에 서투른데, 사교적인 성격상 이들의 성격은 밖으로 쉽게 표출됩니다. 가령 일적으로 비효율적이고 무능하며 게으르다고 판단되는 이들을 보면 이들은 그들의 예민한 부분을 가차 없이 건드리기도 합니다. 통솔자형 사람에게 있어 감정 표현은 나약함의 표시로 이러한 성향 때문에 쉽게 적을 만들기도 합니다. 또한 단순히 목표를 성취하는 데 있어서뿐만 아니라 타인으로부터 인정받고 안 받고의 여부는 효율적인 조직에 달려 있음을 사람들에게 줄기차게 상기시키는데, 이는 통솔자형 사람에게는 매우 민감하고 중대한 사안이기 때문입니다.
</p>
<p class="lead">
  이들은 진정한 권력가형으로 그들 본연의 모습 이상으로 자신을 과대 포장하는 경향이 있습니다. 하지만 그들의 성공이 혼자만의 능력이 아닌 이들을 옆에서 도운 여러 사람에게서 기인한다는 점을 잊지 말아야 합니다. 그리고 함께 한 이들의 헌신과 노력, 재능을 인정하며, 특히 든든한 지원군이 되어 주었음에 온 마음을 다해 감사함을 느끼는 것이 중요합니다. 비록 '안되면 척'이라고 하겠다는 마음가짐이라 하더라도 말입니다. 만일 다른 이들의 감정을 살피는 진심 어린 노력이 이들이 가진 성격적 장점과 합해진다면, 이들은 다른 이들과 더 깊고 만족스러운 인간관계를 형성할 수 있을 것입니다. 그리고 이들 또한 도전 후의 참된 보람을 느낄 수 있을 것입니다.
</p>
<br>
</div>
</body>
</html>