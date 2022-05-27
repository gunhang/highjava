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
<title>INFP</title>
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
  <h3 class="card-header text-center">"INFP" “열정적인 중재자” "잔다르크형"</h3>
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
    <p>금이라고 해서 다 반짝이는 것은 아니며, 헤매고 다니는 자가 모두 길을 잃은 것은 아닙니다.<br> 오래되었어도 강한 것은 시들지 않으며, 깊게 뻗은 뿌리에는 서리가 닿지 않습니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    J. R. R. TOLKIEN<cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    중재자형 사람은 최악의 상황이나 악한 사람에게서도 좋은 면만을 바라보며 긍정적이고 더 나은 상황을 만들고자 노력하는 진정한 이상주의자입니다. 간혹 침착하고 내성적이며 심지어는 수줍음이 많은 사람처럼 비추어지기도 하지만, 이들 안에는 불만 지피면 활활 타오를 수 있는 열정의 불꽃이 숨어있습니다. 인구의 대략 4%를 차지하는 이들은 간혹 사람들의 오해를 사기도 하지만, 일단 마음이 맞는 사람을 만나면 이들 안에 내재한 충만한 즐거움과 넘치는 영감을 경험할 수 있을 것입니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/diplomats_Mediator_INFP_introduction.png" class="img-fluid" alt="diplomats_Mediator_INFP">
<p class="lead">
  이들은 논리나 단순한 흥미로움, 혹은 인생의 실용적인 부분이 아닌 그들 나름의 원리원칙에 근거하여 사고하고 행동합니다. 더욱이 성취에 따르는 보상이나 그렇지 못할 경우에 생길 수 있는 불이익 여부에 상관없이 순수한 의도로 인생의 아름다움이나 명예 그리고 도덕적 양심과 미덕을 좇으며 나름의 인생을 설계해 나갑니다. 그리고 그러한 본인들의 생각과 행동에 자부심을 느끼기도 하는데, 이는 마땅한 일입니다. 하지만 모든 사람이 그들의 생각 뒤에 숨은 동기나 의미를 정확히 파악하지는 못하는데, 이는 자칫 이들을 외톨이로 만들 수도 있습니다.
</p>
<br>

<h3>자기 자신에 대한 깊은 통찰력</h3>
<p class="lead">
  중재자형 사람이 가진 가장 큰 장점은 적절한 은유나 이야기를 통해 그들의 생각을 상징화하여 다른 이들과 깊이 있는 의사소통을 한다는 점입니다. 이러한 직관적인 성향은 이들로 하여금 더 창의적인 일에 몰두하게 합니다. 이를 비추어보면 여러 유명 시인이나 작가, 그리고 배우가 이 성격 유형에 속하는 것이 그리 놀랍지만은 않습니다. 중재자형 사람에게 있어 본인 자신에 대한 이해뿐만 아니라 자신이 속한 세상을 이해하는 것이 매우 중요한데, 이들은 종종 작품에 자신을 투영시켜 세상을 탐구하기도 합니다.
</p>
<blockquote class="blockquote">
  <p>
    자기표현에 특출난 재주를 가지고 있는 이 유형의 사람은 아름다움에 대한 고찰이나 그들이 가지고 있는 비밀을 은유적인 방법이나 작품 속 허구 인물을 등장시켜 표현하기도 합니다.
  </p>
</blockquote>
<p class="lead">
  이들은 또한 뛰어난 언어적 소질을 보이는데 이는 비단 모국어뿐 아니라 제2외국어(심지어는 제3외국어까지!)를 습득하는 데에까지 재능을 보입니다. 이들의 뛰어난 의사소통 능력은 사람들 간의 화합을 도모하며, 그들이 목표한 바를 달성하기 위해 나아가는 데 도움을 줍니다.
</p>
<br>

<h3>다수가 아닌 소수에 더 많은 관심</h3>
<p class="lead">
  다른 외향적 성격 유형에 속하는 사람과 달리, 중재자형 사람은 소수의 몇몇, 그리고 의미 있다고 판단되는 한 가지 목표에만 관심을 기울이는 등 한 번에 많은 일을 달성하려 하지 않습니다. 만일 모든 사회악을 근절하는 데 그들이 할 수 있는 일이 한정되어 있음을 깨닫는 순간, 이들의 에너지는 빛을 잃고 좌절감을 맛보거나 처한 상황에 압도되기도 합니다. 그리고 이는 밝은 장밋빛 미래를 함께 꿈꾸며 가까이에서 지켜보는 다른 이들의 마음을 안타깝게 하기도 합니다.
</p>
<p class="lead">
  자칫하면 중재자형 사람은 선(善)을 위해 하던 행위를 갑자기 멈추거나 하루하루 일상생활을 영위하는 일조차 등한시할 수도 있습니다. 이들은 종종 깊은 생각의 나락으로 자신을 내몰아 이론적 가설이나 혹은 철학적 논리에 빠지기도 하는데, 꾸준한 관심을 가지고 이들을 지켜보지 않으면 이들은 연락을 끊고 '은둔자' 생활을 하기도 합니다. 그리고 추후 이들을 현실 밖으로 다시 돌아오게 하기까지 주위 사람들의 많은 에너지와 노력을 필요로 합니다.
</p>
<p class="lead">
  다행인 것은 깊은 나락에 빠져 있던 이들도 봄이 오면 다시금 봉오리를 피우는 꽃과 같이 이들의 애정 어린 마음과 창의적인 생각, 이타주의적이며 이상주의적인 생각 역시 제자리로 돌아와 자신뿐 아니라 곁에서 지켜보는 이들로 하여금 뿌듯함에 미소 짓게 합니다. 그리고 다시금 사실적 논리나 현실적인 유용성의 관점이 아닌 넘치는 영감과 인간애, 친절함, 그리고 따뜻한 마음으로 세상을 바라봅니다.
</p>
<br>
</div>

</body>
</html>