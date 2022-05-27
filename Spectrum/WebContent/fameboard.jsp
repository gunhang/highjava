<%@page import="spectrum.board.fame.service.FameBoardService"%>
<%@page import="spectrum.board.fame.vo.BoardFameVO"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.mbtiboard.vo.MbtiBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	

<%
	List<BoardFameVO> fameList = FameBoardService.getInstance().boardFameSelect();
	
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css"> --%>
</head>
<body>

	<table class="table table-hover">
		<tr>
			<th scope="col" style="font-size: 1.4rem;">인기게시글</th>
		</tr>
		<tr class="table-active">
			<th>게시판</th>
			<th>닉네임</th>
			<th>제목</th>
			<th>날짜</th>
			<th>추천수</th>
		</tr>
<% 
if(fameList !=null&&fameList.size()>0){	
	for(int i = 0 ; i <fameList.size(); i++){
		String date =fameList.get(i).getDateboard();
		String date2 = date.substring(0,4);
		
		System.out.println(date);
		System.out.println(date2);
		
		
%>

		<tr class="table-active">
			<td><%=fameList.get(i).getMbtiboardClassificationcode() %></td>
			<td><%=fameList.get(i).getMemberNickname() %></td>
			<td><a href="<%=request.getContextPath()%>/mbtiboard/mbtiboarddetail?mbtiboardPostnum=<%=fameList.get(i).getMbtiboardPostnum()%>"><%=fameList.get(i).getMbtiboardTitle()%></a></td>
			<td><%=fameList.get(i).getDateboard()%></td>
			<td><%= fameList.get(i).getRecommend()%></td>
		</tr>
	
		
<% 
	}

}else{
%>
	<tr >
		<td colspan="4">목록이 없습니다!!!</td>
	</tr>
	
<% 
}
%>
</table>

</body>
</html>