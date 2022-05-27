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
<title>ISFJ</title>
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
  <h3 class="card-header text-center">"ISFJ" “용감한 수호자” "임금 뒤편의 권력형"</h3>
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
    <p>사랑은 나눌수록 커집니다.<br> 다른 이에게 나누어 주면 줄수록 당신에게 돌아오는 사랑 또한 더욱 커집니다.</p>
  </blockquote>
  <figcaption class="blockquote-footer">
    BRIAN TRACY <cite title="Source Title"><!-- 소스(책,영화)제목 --></cite>
  </figcaption>
</figure>
<br>

	<p class="lead">
    수호자형 사람은 꽤 독특한 특징을 가지고 있는데, 이 유형에 속하는 사람은 이들을 정의하는 성격 특성에 꼭 들어맞지 않는다는 점입니다. 타인을 향한 연민이나 동정심이 있으면서도 가족이나 친구를 보호해야 할 때는 가차 없는 모습을 보이기도 합니다. 조용하고 내성적인 반면 관계술에 뛰어나 인간관계를 잘 만들어갑니다. 안정적인 삶을 지향하지만 이들이 이해받고 존경받는다고 생각되는 한에서는 변화를 잘 수용합니다. 이처럼 수호자형 사람은 한마디로 정의 내리기 힘든 다양한 성향을 내포하고 있는데, 이는 오히려 그들의 장점을 승화시켜 그들 자신을 더욱 돋보이게 합니다.
</p>
<blockquote class="blockquote">
  <p>
    수호자형 사람은 무엇을 받으면 몇 배로 베푸는 진정한 이타주의자로 열정과 자애로움으로 일단 믿는 이들이라면 타인과도 잘 어울려 일에 정진합니다.
  </p>
</blockquote>
<p class="lead">
  약 13%로 꽤 높은 인구 비율을 차지하는데, 인구 대다수를 차지하는 데 있어 이들보다 더 나은 성격 유형은 아마 없을 것입니다. 이들은 종종 의료 부분이나 학문, 혹은 사회단체와 같이 오랜 역사나 전통과 관련된 분야에 종사합니다.
</p>
<img src="<%=request.getContextPath()%>/imeges/sentinels_Defender_ISFJ_introduction.png" class="img-fluid" alt="sentinels_Defender_ISFJ">
<p class="lead">
  수호자형 중 특히 신중한 성향을 가진 사람은 완벽주의자만큼이나 세심하고 꼼꼼한 면모를 보이기도 합니다. 간혹 일을 지연하는 경우가 있기는 하지만, 그렇다고 일을 시간 내에 마치지 않는 것은 아닙니다. 이들은 맡은 바 일에 책임감을 가지고 업무에 임하며, 회사나 가정에서 그들의 기대치를 넘어 주위 사람들을 만족시키고자 최선을 다합니다.
</p>
<br>

<h3>공(功)을 공(功)이라 말할 수 있는 용기</h3>
<p class="lead">
  수호자형 사람은 그들의 업적이나 실적을 다른 사람들이 알아차리게 하는 데 어려움을 느낍니다. 이들은 종종 자신이 이룬 성취를 과소평가하는 경향이 있는데, 이러한 겸손한 태도로 종종 다른 이들로부터 존경을 받기도 하는가 하면, 이기적이고 냉소적인 사람들은 이들의 겸손함을 역으로 이용하여 수호자형 사람이 세운 공을 자신의 것으로 돌리는 경우도 있습니다. 자신감과 열정을 지키기 위해서는 이들도 '아니요'라고 말해야 할 때와 자기 자신을 방어해야 할 때를 정확히 인지할 필요가 있습니다.
</p>
<p class="lead">
  내성적이면서 신기하게도 사회적인 성향을 가지고 있기도 한 이들은 좋은 기억력을 자랑합니다. 뛰어난 기억력으로 단순히 데이터나 사소한 정보를 기억하는 것이 아니라, 만나는 사람들이나 그들과 관련한 소소한 사항들을 모두 기억해 놓습니다. 상상력과 타고난 섬세함으로 그들의 자애로운 마음을 표현함으로써 상대방의 가슴을 진심으로 울리는 데 이들보다 더 천부적으로 소질이 있는 이들도 없을 것입니다. 이는 함께 일하는 동료들 사이에서도 자명한 일로, 이들은 동료를 가까운 친구로 여깁니다. 그러나 뭐니 뭐니 해도 이들의 애정과 사랑이 환하게 꽃을 피우는 곳은 바로 가정 내에서 일 것입니다.
</p>
<br>


<h3>해야 할 땐 과감히</h3>
<p class="lead">
  수호자형 사람은 가치 있다고 여기는 일이 마무리되지 않고 있으면 게으르게 가만히 앉아만 있지 못하는 이타주의적 성격을 가지고 있습니다. 다른 내향적인 성격의 사람들과 견주어 봐도 이들만큼 타인과 친밀한 관계를 유지하는 이들이 없습니다. 또한 서로 응원하고 힘을 북돋워 주며 화목한 가정을 꾸려 나가는 것을 옆에서 지켜보는 것 자체가 가족에게는 큰 축복이 아닐 수 없습니다. 이들은 화려한 스포트라이트를 받는 것을 불편해하며, 다른 이들과 함께 달성한 업무에 있어 공을 인정받는 데에 어색해하기도 합니다. 하지만 이들이 그들 자신의 노력을 알리는 데 조금 더 열중한다면 다른 유형의 사람이었다면 그저 상상만 하고 있을 법한 일을 성취해 냄으로써 더 큰 자신감을 얻을 수 있을 것입니다.
</p>
</div>

</body>
</html>