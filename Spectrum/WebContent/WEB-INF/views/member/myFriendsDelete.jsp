<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<script type="text/javascript">
alert('DISCONNECT가 정상적으로 처리되었습니다.');
window.location ='<%=request.getContextPath()%>/myFriendsList.do';
</script>

</body>
</html>
