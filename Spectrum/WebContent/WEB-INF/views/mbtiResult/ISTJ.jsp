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
<title>ISTJ</title>
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
  <h3 class="card-header text-center">"ISTJ" “청렴결백한 논리주의자” "세상의 소금형"</h3>
  <div class="card-body">
      <h5 class="card-title text-center">에너지의 방향</h5>
      <div class="container">
        <div class="row">
           <p class="col">내향</p>
          <p class="col text-end">외향</p>
      </div>
      </div>
      <div class="progress">
          <div class="progress-bar bg-success" role="progressbar" style="width: <%=mbtiIndicatorsI%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="container">
          <div class="row">
            <p class="col"><%=mbtiIndicatorsI%>%</p>
            <p class="col text-end"><%=mbtiIndicatorsE%>%</p>
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
    <p>내가 본 바에 의하면 임무를 수행함에 있어 한 명이면 족한 일을 둘이서 수행하면 될 일도 안되거니와,<br> 셋 이상이 하는 경우에는 일이 전혀 성사되지 않더군.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    GEORGE WASHINGTON <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
  논리주의자형은 가장 다수의 사람이 속하는 성격 유형으로 인구의 대략 13%를 차지합니다. 청렴결백하면서도 실용적인 논리력과 헌신적으로 임무를 수행하는 성격으로 묘사되기도 하는 이들은, 가정 내에서뿐 아니라 법률 회사나 법 규제 기관 혹은 군대와 같이 전통이나 질서를 중시하는 조직에서 핵심 구성원 역할을 합니다. 이 유형의 사람은 자신이 맡은 바 책임을 다하며 그들이 하는 일에 큰 자부심을 가지고 있습니다. 또한, 목표를 달성하기 위해 시간과 에너지를 허투루 쓰지 않으며, 이에 필요한 업무를 정확하고 신중하게 처리합니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/sentinels_Logistician_ISTJ_introduction.png" class="img-fluid" alt="sentinels_Logistician_ISTJ">
<p class="lead">
  뭐든 쉽게 가정하여 결론 내리지 않는 이들은, 주변을 객관적으로 분석하고 사실에 입각하여 현실적으로 실행 가능한 계획을 세우는 것을 선호합니다. 허튼짓하는 것을 무엇보다도 싫어하는 사람으로 결정을 내린 후에는 목표를 달성하는 데 필요한 사실을 열거함으로써 다른 이들로 하여금 이를 재빨리 인지하여 즉시 실행해 옮기기를 독려합니다. 특히나 우유부단한 것을 몹시 싫어하며, 혹 결정 내린 실행안이 비현실적인 이유로 장애에 부딪혔을 때 쉬이 인내심을 잃기도 하는데, 특히 목표 달성에 필요한 핵심 세부사항을 놓치는 경우에는 더욱 그러합니다. 만일 마감 시간은 가까워져 오는데 논의가 성사되지 않은 채 시간만 질질 끄는 경우, 이들의 불편함 심기가 얼굴에 그대로 나타나기도 합니다.
</p>
<br>

<h3>뱉은 말에 대한 책임과 평판</h3>
<p class="lead">논리주의자형 사람이 무언가를 하겠다고 하면 얼마나 많은 희생이 따르던지 자신이 한 말에 책임을 지고자 기어이는 해내고야 맙니다. 이런 그들이기에 자신이 내뱉은 말에 책임을 지지 않는 이들을 보면 어쩔 줄 몰라 합니다. 태만과 부도덕의 조합만큼 논리주의자형 사람의 적이 되는 가장 빠른 지름길도 없을 것입니다. 때문에 이들은 혼자 일하는 것을 선호하며, 대개 일을 진행하는 데 직장 내 토의를 거치거나 다른 이들의 견해를 들을 필요 없이 자신만의 목표를 설정하고 달성을 가능케 하는 어느 정도의 지위나 권한을 가지고 있는 경우가 많습니다.

  예리하며 사실에 근거하여 사고하는 경향을 가지고 있는 이들은 자율적으로 스스로 알아서 행동하고 책임지기를 원합니다. 이 때문에 이들은 누군가에게 의존하는 것은 약자의 행동이라고 여깁니다. 임무 달성을 위한 열정과 책임감, 그리고 오점 하나 없는 청렴한 이들의 성격으로 하여금 이들을 종종 이러한 오류에 쉽게 빠지게 합니다.
  
  이들의 청렴결백한 성격은 논리주의자형 사람을 정의하는 핵심사항으로, 이는 그들이 생각하는 것 이상으로 중요한 부분입니다. 얼마나 많은 희생이 따르든 이들은 일단 정해진 체계나 지침을 고수하며, 비록 사실을 있는 그대로 밝히는 것이 결과적으로 더 큰 분란을 야기할지라도 자신의 잘못을 시인하고 사실을 밝히고자 합니다. 논리주의자형 사람에게 있어 감정적인 고려보다 정직함이 보다 우선시 되기 때문입니다. 때로 이러한 그들의 대담한 행보는 사람들에게 냉정하고 로봇 같다는 잘못된 인상을 심어 주기도 합니다. 감정이나 애정을 밖으로 표출하는 것에 익숙하지 않은 이들은 혹 사람들로부터 냉혈인이라든지, 더 심하게는 ‘감정 자체가 있느냐’와 같은 말을 듣기도 하는데 이에 깊은 상처를 받기도 합니다.</p>
  
<h3>백해무익한 무리와 있느니 차라리 혼자가 낫다</h3>
<p class="lead">논리주의자형 사람의 헌신적인 성격은 매우 긍정적인 자질로 이들로 하여금 많은 것을 이루게 합니다. 하지만 이는 동시에 이들의 약점이 되기도 하는데, 간혹 비양심적인 사람들은 이러한 이들의 약점을 이용하기도 합니다. 안전하며 안정된 삶을 추구하는 논리주의자형 사람은 일이 원활하게 돌아갈 수 있도록 맡은 바 임무를 충실히 수행합니다. 뒤치다꺼리를 마다치 않는 이들의 성향을 아는 동료나 주위 사람들은 간혹 이들에게 책임을 전가하는 경우가 있습니다. 더욱이 개인적인 견해가 아닌 사실만을 얘기하고자 하는 이들의 성향 때문에 정확히 사실을 밝혀 낼 증거가 충분히 모일 때까지 시간이 오래 걸리기도 합니다.

  이들은 그들 자신 또한 챙기고 돌보아야 할 필요가 있음을 잊지 말아야 합니다. 갈수록 기대기만 하는 이들에게 언제고 싫은 내색 한번 않는 논리주의자형 사람들이기 때문에 일단 감정의 골이 쌓여 터진 후 돌아오기 늦어버리는 상황을 초래하기 전 안정과 효율성 추구를 위한 완강하고 헌신적인 이들의 성격을 활용하여 장기간 목표를 달성하기 위한 절충점을 찾아야 합니다. 활기차고 명료하며 안정된 삶을 추구하는 이들의 성향을 진심으로 이해하고 보듬으며 이들이 가진 단점을 보완해주는 동료나 배우자를 만난다면, 이들은 안정을 추구하는 자신의 성향으로 하여금 일을 순리대로 잘 돌아가게 하는 데 지대한 역할을 하고 있다는 생각에 큰 만족감을 느낄 것입니다.</p>
</div>
</body>
</html>