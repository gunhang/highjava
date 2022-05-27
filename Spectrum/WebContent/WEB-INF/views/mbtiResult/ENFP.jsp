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
<title>ENFP</title>
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
  <h3 class="card-header text-center">"ENFP" “재기발랄한 활동가” "스파크형"</h3>
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
    <p>당신이 생계를 위해 무슨 일을 하는지, 저는 관심 없습니다. <br>다만 제가 알고 싶은 건 당신이 가슴 저리게 동경하는 것이 있는지, 당신 마음속 깊은 바람을 감히 충족시키고자 하는 열망이 있는지입니다.<br> 당신의 나이가 얼마인지는 중요하지 않습니다. <br>당신이 사랑을 위해, 당신의 꿈을 위해, 그리고 삶이라는 모험을 위해 기꺼이 바보가 될 준비가 되어 있는지, 그것이 궁금할 뿐입니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    MARILYN MONROE <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>
	
	<p class="lead">
    활동가형 사람은 자유로운 사고의 소유자입니다. 종종 분위기 메이커 역할을 하기도 하는 이들은 단순한 인생의 즐거움이나 그때그때 상황에서 주는 일시적인 만족이 아닌 타인과 사회적, 정서적으로 깊은 유대 관계를 맺음으로써 행복을 느낍니다. 매력적이며 독립적인 성격으로 활발하면서도 인정이 많은 이들은 인구의 대략 7%에 속하며, 어느 모임을 가든 어렵지 않게 만날 수 있습니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/diplomats_Campaigner_ENFP_introduction.png" class="img-fluid" alt="diplomats_Campaigner_ENFP">
<br>

<h3>아이디어 하나로 세상을 바꾸다!</h3>
<p class="lead">
  타인을 즐겁게 하는 사교적인 특성만이 이들이 가진 전부가 아닙니다. 활동가형 사람은 통찰력 있는 비전으로 호기심과 에너지 사이의 선을 명확히 구분합니다. 이들은 인생을 하나로 연결된 크고 복잡한 퍼즐로 보는 경향이 있는데, 인생을 체계적인 일련의 과정으로 보는 분석가형 사람과 달리 인간의 감정이나 인정(人情), 신비로움을 프리즘에 투영하여 그 안에 숨어있는 깊은 의미를 찾아내고자 합니다.
</p>
<blockquote class="blockquote">
  <p>
    다소 과하리만치 독립적인 성향의 이들은 안정적이거나 안전한 삶이 아닌 창의적이며 자유로운 삶을 갈망합니다.
  </p>
</blockquote>
<p class="lead">
  다른 성격 유형에 속한 사람들은 활동가형 사람들에게서 거부할 수 없는 이들만의 매력을 느낄 수 있습니다. 일단 창의력에 발동이 걸리면 이들은 스포트라이트를 받는 주인공이 되어 동료나 사람들로부터 리더 혹은 전문가로 추앙받기도 합니다. 하지만 이는 독립적이며 자유를 최고로 여기는 활동가형 사람들이 선호하는 바는 아니며, 만일 반복적인 관리 업무를 요구하는 자리에 있는 경우라면 더욱이 그러합니다. 창의적인 문제 해결을 위한 대책을 찾는 데서 큰 자부심을 얻는 활동가형 사람에게 혁신적인 사고를 가능하게 하는 자유의지 여부가 매우 중요합니다. 만일 그들 자신이 지루한 일상적인 업무에 갇혀 있다고 생각될 경우, 이들은 쉬이 낙담하거나 인내심을 잃을 수도 있기 때문입니다.
</p>
<br>

<h3>‘살짝 미치면’ 인생이 즐겁다?</h3>
<p class="lead">
  다행히도 활동가형 사람은 언제 어떻게 휴식을 취해야 하는지 잘 알고 있습니다. 일할 때는 열정적이며 진취적인 모습이었다가 단숨에 무대 위 열성적으로 몸을 흔드는 자유로운 영혼의 모습으로 단숨에 변모하기도 하는 이들은 이러한 갑작스러운 변화로 종종 가까이에 있는 친구들이나 지인들을 놀라게 하기도 합니다. 이들의 다양한 성격적 면모는 다른 이들과의 정서적인 교감을 가능하게 하며, 특히나 친구 혹은 동료들에게 색다른 통찰력을 제공함으로써 영감을 불어 넣기도 합니다. 활동가형 사람은 모든 이들이 자신의 솔직한 감정에 귀 기울이고 이를 표현할 수 있는 시간이 필요하다고 믿습니다. 이러한 이유로 다양한 인간 감정이나 인간관계에 대한 내용이 이들과 대화 시 단골 소재입니다.
</p>
<p class="lead">
  하지만 이런 활동가형 사람에게도 주의해야 할 사항이 있습니다. 만일 이들이 그들의 직관에 지나치게 의존한 나머지 사람들의 의도를 잘못 해석하는 경우 오해가 생겨 계획에 차질을 빚을 수 있는데, 이는 단도직입적으로 충분히 해결할 수 있는 문제를 더 어렵게 만드는 길입니다. 이러한 사회생활에서 빚어지는 스트레스는 협력과 조화를 중요시 여기는 성격의 사람들에게는 이들의 잠을 설치게 하는 근심 요소가 될 수 있습니다. 이들은 혹 실수로 누군가의 발을 밟았다 할 경우, 이들 역시 발을 밟힌 사람과 같은 고통을 느끼는 감성적이면서도 예민한 성격의 소유자입니다.
</p>
<p class="lead">
  활동가형 사람은 인간관계나 사람의 감정, 혹은 생각과 관련하여 이들이 원하는 만족스러운 대답을 찾을 때까지 끊임없이 찾아 헤매고 다닐 것입니다. 그리고 진정 그들이 원하는 답을 찾는 그 날, 이들의 상상력이나 인간애, 그리고 용기는 어마어마한 빛을 발할 것입니다.
</p>
<br>
</div>
</body>
</html>