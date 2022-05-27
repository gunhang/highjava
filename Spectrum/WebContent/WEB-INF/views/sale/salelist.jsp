<%@page import="javax.swing.plaf.basic.BasicInternalFrameTitlePane.MaximizeAction"%>
<%@page import="spectrum.sale.vo.SaleVO"%>
<%@page import="spectrum.rank.vo.RankVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	
	List<SaleVO> saleList =
					(List<SaleVO>) request.getAttribute("saleList");

	String msg = request.getParameter("msg") == null
			? "" :request.getParameter("msg");
	
	    	int totalpayment =0;
	    	int totalpayment2020 =0;
	    	int totalpayment2021 =0;
	    	int totalpayment2022 =0;
	int saleSize =saleList.size();
	
	if(saleSize >0){
		for(int p=0; p < saleSize; p++){
	     String date = String.valueOf(saleList.get(p).getPaymentDate());
		String datetwo = date.substring(0, 4);	
	 
	    	 System.out.println(datetwo.substring(0, 2));
	     totalpayment += Integer.valueOf(saleList.get(p).getPaymentAmount());
	     System.out.println(totalpayment);
	     if(datetwo.equals("2020")){
	    	totalpayment2020 = totalpayment2020 + Integer.valueOf(saleList.get(p).getPaymentAmount());
	    	System.out.println(totalpayment2020);
	     }else if(datetwo.equals("2021")){
	    	 totalpayment2021 = totalpayment2021 + Integer.valueOf(saleList.get(p).getPaymentAmount());
	    	 System.out.println(totalpayment2021);
	     }else if(datetwo.equals("2022")){
	    	 totalpayment2022 = totalpayment2022 + Integer.valueOf(saleList.get(p).getPaymentAmount());
	    	 System.out.println(totalpayment2022);
	     }
		}
	}

	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>회원 목록</title>
<style>

/*  table {
    margin-left:auto; 
    margin-right:auto;
}

h1 {
	  margin-left:auto; 
    margin-right:auto;
     border-collapse : collapse;
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
    width: 5%;
    height: 10;
}   */

.table-div{
    padding: 20%;
    padding-top: 0;
    }
  .table > tbody {
    vertical-align: middle;
}
.table-active.table-two{
	text-align: right;
}
.table-active.table-two th{
	padding-right: 50px;	
}
#chart_div{
	opacity: 0.3;
}
h1 {
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', '매출');
	
      data.addRows([
    	  [2020, 0],  [2020, 0],  [2020, 0],  [2020, 0],  [2020, 0],  [2020, 0], 
    	  [2020, 0],  [2020, 0],  [2020, 5000],  [2020, 5000],  [2020, 0],  [2020, 0], 
    	  [2021, 5000],  [2021, 7500],  [2021, 0],  [2021, 0],  [2021, 0],  [2021, 0], 
    	  [2021, 0],  [2021, 0],  [2021, 0],  [2021, 0],  [2021, 0],  [2021, 10000], 
    	  [2022, 37500] 
      ]);

      var options = {
        hAxis: {
          title: '년도'
        },
        vAxis: {
          title: '매출'
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
</script>

</head>
<body>
<div id="header">
    <%@include file="/navbar.jsp" %>
</div>

<div id="detailPadding" style="padding-top: 100px"></div>
<div class="table-div">
<h1>매출기록 </h1>
<table class="table table-hover">
	<tr class="table-active">
		<th scope="col">매출 기록번호</th>
		<th scope="col">결제한 아이디</th>
		<th scope="col">결제한 날짜</th>
		<th scope="col">누적 결제 금액</th>		
	</tr>
	<%
		 saleSize =saleList.size();
		if(saleSize  > 0) {
			for(int i=0; i < saleSize ; i++){
				
		
	%>
	<tr class="table-active">
		<td scope="col"><%=saleList.get(i).getPaymentNumber() %></td>
		<td scope="col"><%=saleList.get(i).getMemberId() %></a></td>
		<td scope="col"><%=saleList.get(i).getPaymentDate() %></td>
		<td scope="col"><%=saleList.get(i).getPaymentTotalamount() %></td>
		
		
	</tr>
	<%
		}
	}else{
	%>
	<tr>
		<td colspan="4">회원 정보가 없습니다.</td>
	</tr>
	<% 
	}
	%>
	<tr class="table-active table-two">
		<th colspan="2" scope="col">2020년 총매출</th>
		<td ><%=totalpayment2020 %>원</td>
		<td></td>
	</tr>
	<tr class="table-active table-two">
		
		<th colspan="2" scope="col">2021년 총매출</th>
		<td><%=totalpayment2021 %>원</td>
		<td></td>
	</tr>
	<tr class="table-active table-two">
		
		<th colspan="2" scope="col">2022년 총매출</th>
		<td><%=totalpayment2022 %>원</td>
		<td></td>
	</tr>
	
	<tr class="table-active table-two">
		
		<th colspan="2" scope="col">전체 총매출</th>
		<td><%=totalpayment %>원</td>
		<td></td>
	</tr>
</table>
</div>



<%
	if(msg.equals("성공")){
%>
	<script>
		alert("정상적으로 처리되었습니다.");
	</script>
<%		
	}
%>

<%


%>
  <div id="chart_div"></div>


</body>
</html>