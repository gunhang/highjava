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
<title>INTP</title>
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
  <h3 class="card-header text-center">"INTP" “논리적인 사색가” "아이디어 뱅크형"</h3>
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
        <p class="col">인식</p>
        <p class="col text-end">판단</p>
    </div>
    </div>
  <div class="progress">
      <div class="progress-bar bg-danger" role="progressbar" style="width: <%=mbtiIndicatorsP%>%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
  </div>
  <div class="container">
      <div class="row">
       <p class="col"><%=mbtiIndicatorsP%>%</p>
        <p class="col text-end"><%=mbtiIndicatorsJ%>%</p>
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
    <p>과거에서 배우되, 현재에 살며, 미래에 대한 희망을 가지세요.<br> 그리고 중요한 것은 질문하는 일을 멈추지 않는 것입니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    ALBERT EINSTEIN <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    사색가형은 전체 인구의 3% 정도를 차지하는 꽤 흔치 않은 성격 유형으로, 이는 그들 자신도 매우 반기는 일입니다. 왜냐하면, 사색가형 사람보다 '평범함'을 거부하는 이들이 또 없기 때문입니다. 이 유형의 사람은 그들이 가진 독창성과 창의력, 그리고 그들만의 독특한 관점과 왕성한 지적 호기심에 나름의 자부심을 가지고 있습니다. 보통 철학자나 사색가, 혹은 몽상에 빠진 천재 교수로도 많이 알려진 이들은 역사적으로 수많은 과학적 발전을 이끌어 내기도 하였습니다.
</p>
<br>
<h3>연구되지 않은 삶은 의미가 없다!</h3>
<blockquote class="blockquote">
  <p>
    천재적인 이론이나 난해한 논리로 유명한 이들은 다른 성격 유형과 비교하여 가장 논리적인 사람들로 알려져 있습니다.
  </p>
</blockquote>
<p class="lead">
  이들은 사건이나 사물의 어떠한 일련의 연속성에 관심이 많으며, 사람들의 언행에 불일치되는 부분을 집어내 트집 잡는 것을 즐기는데, 이는 거의 취미 수준에 가까울 정도입니다. 때문에 이들에게 거짓말은 하지 않는 것이 좋습니다. 또 한 가지 아이러니한 점은 이들의 얘기를 곧이곧대로 듣지 말고 잘 새겨 들어야 한다는 것입니다. 이는 이들이 솔직하지 않아서가 아니라 아직 채 명확히 규명되지 않은 생각이나 이론에 대하여 얘기하는 경향이 있기 때문입니다. 이들은 상대방을 실질적인 대화 상대로 보는 것이 아니라 그들의 생각이나 이론을 펴기 위한 하나의 대상으로 여깁니다.
</p>
<p class="lead">
  이러한 성향 때문에 이들에게 일을 맡기는 게 불안하게 느껴질 수도 있지만, 사실 사색가형 사람보다 문제를 정확히 파악하고 이를 둘러싸고 있는 요소를 낱낱이 파헤쳐 독창적이며 실행 가능한 해결책을 찾아내는 데 더 열성적이고 뛰어난 사람은 없습니다. 단, 이들에게서 업무 진행 상황에 따른 보고서 따위를 제출받기를 기대하지는 않는 게 좋습니다. 이 성격 유형의 사람은 실질적인 하루하루 업무나 유지에는 관심이 없기 때문입니다. 하지만 일단 이들의 천재성과 잠재력이 활개 칠 수 있는 환경이 조성되면 이들은 통찰력 있고 편향되지 않은 해결책을 찾는 데 그들이 가진 모든 시간과 에너지를 모두 쏟아부을 것입니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/analysts_Logician_INTP_introduction.png" class="img-fluid" alt="analysts_Logician_INTP">
<br>

<h3>지혜는 호기심으로부터 시작</h3>
<p class="lead">
  이런저런 몽상에 사로잡혀 있는 듯한 모습을 자주 보이는 이들은 한시도 쉼 없이 생각에 몰두합니다. 심지어는 아침에 눈을 뜰 때조차도 쉴 새 없이 쏟아지는 아이디어와 함께 하루를 시작합니다. 머릿속에서 끊임없는 벌어지는 논쟁과 생각으로 수심에 가득 차 보이거나 혼자 동떨어져 있어 보이기도 하지만, 이들과 비슷한 관심사를 가진 사람 혹은 친밀한 관계의 이들과 있을 때면 편안하고 밝은 모습을 보입니다. 이와 대조적으로 낯선 이들과 있을 때는 극도로 수줍어하며, 만일 이들이 논리적으로 내린 결론이나 이론이 상대방으로부터 비판을 받거나 하는 경우가 생기면 가벼운 농담에도 호전적인 태세를 보이기도 합니다.
</p>
<p class="lead">
  특히나 흥분된 상태에서 이야기할 때에는 대화에 일관성이 떨어지기도 하는데, 이는 가장 최근 정립한 이론이 결론에 도달하기까지 일련의 논리적 연결 고리를 모두 설명하려 들기 때문입니다. 이들은 또한 상대방이 그들의 논리를 충분히 이해하지 못하였음에도 쉽게 풀어 설명하거나 하지 않은 채 대화를 다른 주제로 옮기기도 합니다.
</p>
<p class="lead">
  주관적인 관점이나 감정에 치우쳐 사고하는 사람과 비교해보면 아마도 이들의 사고 과정을 보다 잘 이해할 수 있을 것입니다. 가령 매우 정교하고 복잡한 시계 작동법을 창의적으로 사고하되, 가능한 한 하나의 사실도 빠짐없이 논리적으로 가장 합당한 결론에 이르게 설명한다고 상상해 보십시오. 이것이 바로 사색가형 사람이 사고하는 방식입니다. 이들은 감정 망치가 이들의 사고방식에 훼방 놓는 것을 한치도 용납하지 않습니다.
</p>
<br>

<h3>세상을 변화시키고자 하는 당신, 먼저 자신부터 변화하십시오!</h3>
<p class="lead">
  또한 이들은 다른 이의 감정 섞인 불평이나 불만을 전혀 이해하지 못하기 때문에 친구들은 그들에게서 어떠한 정서적인 위로나 위안을 받지 못합니다. 더욱이 사색가형 사람은 근본적으로 내재되어 있는 문제 해결을 위한 논리적인 해결책을 제안하는 것을 선호하는데, 이는 감성적인 성향의 사람과는 대조되는 부분입니다. 이러한 이들의 성향은 나아가 저녁 모임 계획이나 결혼 준비와 같은 기타 사회적 만남이나 활동에도 영향을 미치는데 이들은 기본적으로 지나치리만치 독창성과 효율적인 결과를 좇는 경향이 있습니다.
</p>
<p class="lead">
  이들의 앞길을 가로막는 한 가지 장애물은 계속해서 드는 실패에 대한 두려움입니다. 사색가형 사람은 혹 자신이 중요한 퍼즐 조각을 놓친 것은 아닌지, 혹 이로 인해 자신이 정체되거나 그들의 지식이 아직 실질적으로 적용되지 않은 무형의 세계에서 길을 잃는 것은 아닌지를 걱정하며 자신의 생각이나 이론을 끊임없이 재평가하는 경향이 있습니다. 자기 자신에 대한 의구심을 극복하는 것이 이들이 직면한 가장 큰 과제입니다. 하지만 그것이 크든 작든, 이들이 가진 지적 능력에서 말미암은 이들의 도전은 그 자체만으로도 세상에 큰 가치를 가져옵니다.
</p>
</div>

</body>
</html>