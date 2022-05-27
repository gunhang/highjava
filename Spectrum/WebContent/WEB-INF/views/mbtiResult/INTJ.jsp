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
<title>INTJ</title>
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
  <h3 class="card-header text-center">"INTJ" “용의주도한 전략가” "과학자형"</h3>
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
    <p>당신은 의견을 가질 권리가 없습니다. <br>다만 제대로 된 의견을 가질 권리만 있을 뿐이죠. 그 누구도 무식할 권리는 없기 때문입니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    HARLAN ELLISON <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    윗자리에 있는 사람은 고독한 법, 전략적 사고에 뛰어나며 매우 극소수인 건축가형 사람은 이를 누구보다 뼈저리게 이해합니다. 전체 인구의 2%에 해당하는 이들은 유독 여성에게서는 더욱 찾아보기 힘든 유형으로, 인구의 단 0.8%를 차지합니다. 체스를 두는 듯한 정확하고 계산된 움직임과 풍부한 지식을 소유하고 있는 이들은 그들과 견줄 만한 비슷한 부류의 사람을 찾는 데 종종 어려움을 겪습니다. 건축가형 사람은 상상력이 풍부하면서도 결단력이 있으며, 야망이 있지만 대외적으로 표현하지 않으며, 놀랄 만큼 호기심이 많지만 쓸데없는 데 에너지를 낭비하는 법이 없습니다.
</p>
<h3>올곧은 태도로 계획 달성을 향한 돌진</h3>
<p class="lead">
  이들의 지식을 향한 갈증은 어릴 적부터 두드러지게 나타나는데, 때문에 건축가형 사람은 어릴 때 '책벌레'라는 소리를 자주 듣습니다. 대개 친구들 사이에서는 놀림의 표현임에도 불구하고 전혀 개의치 않아 하며, 오히려 깊고 넓은 지식을 가지고 있는 그들 자신에게 남다른 자부심을 느낍니다. 이들은 또한 관심 있는 특정 분야에 대한 그들의 방대한 지식을 다른 이들과 공유하고 싶어 하기도 합니다. 반면, 일명 가십거리와 같이 별 볼 일 없는 주제에 대한 잡담거리보다는 그들 나름의 분야에서 용의주도하게 전략을 세우거나 이를 실행해 옮기는 일을 선호합니다.
</p>

<img src="<%=request.getContextPath()%>/imeges/analysts_Architect_INTJ_introduction.png" class="img-fluid" alt="analysts_Architect_INTJ">
<p class="lead">
  대부분 사람 누가 봐도 이들은 지극히 모순적인 삶을 살아가는 것처럼 보이지만 이를 객관적이고 이성적으로 놓고 보면 사실 이해가 가기도 합니다. 예를 들면, 이들은 비현실적일 만큼 이상주의자이자인 동시에 매우 신랄한 조롱과 비판을 일삼는 냉소주의자로 이 둘이 같이 공존한다는 것 자체가 불가능해 보입니다. 또한, 기본적으로 지혜와 노력, 그리고 신중함만 있으며 못할 것이 없다고 믿는 한편, 사람들이 실질적으로 그러한 성취를 끌어내는 데 있어서는 게으르고 근시안적이며 자기 잇속만 차린다고 생각합니다. 그렇다고 이러한 냉소적인 태도가 성취하고자 하는 이들의 욕구를 꺾지는 못합니다.
</p>
<br>
<h3>돌부처와 같은 원칙주의자</h3>
<p class="lead">
  확신에 찬 자신감과 함부로 범접할 수 없는 신비로운 아우라를 발산하는 건축가형 사람은 통찰력과 관찰력, 기발한 아이디어, 그리고 뛰어난 논리력에 강한 의지와 인격이 합쳐져 변화를 이끄는 데 앞장섭니다. 이따금 이들이 생각했던 아이디어나 계획을 뒤집고 재수립하는 과정을 거쳐 완벽함을 추구하고자 하거나 도덕적 잣대에 따라 재정비하는 시간을 가지기도 합니다. 건축가형 사람의 업무 스타일을 좇아오지 못하거나 심지어는 이들이 왜 그렇게 행동하는지 전혀 감을 잡지 못하는 사람은 단번에 신임을 잃거나 이들의 인정을 받지 못할 수도 있습니다.
</p>
<blockquote class="blockquote">
  <p>
    건축가형 사람이 몸서리치게 싫어하는 것이 있다면 바로 질서, 한계, 그리고 전통과 같은 것들인데, 이들은 세상의 모든 것을 탐구와 발견의 대상으로 여기기 때문입니다. 만일 문제 해결을 위한 방안을 찾은 경우, 간혹 무모할 수 있으나 기술적으로 뛰어나며 언제나 그렇듯 비정통적인 기발한 방법이나 아이디어를 수립하기 위해 홀로 행동에 옮깁니다.
  </p>
</blockquote>
<p class="lead">
  그렇다고 이들이 충동적이라는 말은 아닙니다. 얼마나 간절히 성취하기를 원하는지 상관없이 건축가형 사람은 기본적으로 이성적인 사고를 합니다. 내부에서 비롯되었든 아니면 외부 세계에서 기인하였든지, 매사 이들의 아이디어는 “실현 가능할까?”와 같은 ‘이성적 사고’라는 필터의 과정을 거칩니다. 이는 사람 혹은 아이디어에 항시 적용되는 기제로, 이 때문에 건축가형 사람은 종종 곤경에 빠지기도 합니다.
</p>
  
<h3>홀로 떠나는 여행, 깨달음의 시간</h3>
<p class="lead">
  오랜 시간 방대한 지식을 쌓아 온 똑똑하고 자신감 넘치는 이들이지만, 인간관계만큼은 이들이 자신 있어 하는 분야가 아닙니다. 진리나 깊이 있는 지식을 좇는 이들에게 선의의 거짓말이나 가벼운 잡담은 그저 낯설기만 합니다. 그럼에도 불구하고 자신을 필요 이상으로 내몰아 부조리투성이인 사회적 관습을 경험하기도 합니다. 가장 좋은 것은 이들이 그들 자신 자체로 온전히 있을 수 있는 곳, 즉 스포트라이트 밖에 있는 것입니다. 건축가형 사람은 익숙하고 편안한 곳에서 본연의 모습으로 있을 때 비로소 연인 관계나 그 외 여러 상황에서 그들 나름의 빛을 발하며 사람들을 끌어들이기 때문입니다.  
</p>
<p class="lead">
  건축가형 사람의 성향을 정의하자면 이들은 인생을 마치 체스를 두듯이 새로운 계획이나 전술, 그리고 대책을 세워가며 상대방 머리 위에서 수를 두며 허를 찌르는 기술로 상황을 유리하게 몰고 가는 듯한 삶을 살아갑니다. 그렇다고 이들이 양심 없는 삶을 살아간다는 말은 아닙니다. 다만 감정에 치우치는 것을 싫어하는 이들의 성격상 타인의 눈에 그렇게 비추어질 수 있습니다. 이를 고려하면 왜 많은 허구 속 등장인물들(종종 오해를 받곤 하는 영화 속 영웅들)이 본 성격 유형으로 묘사되는지 이해할 수 있을 것입니다.
</p>
</div>
</body>
</html>