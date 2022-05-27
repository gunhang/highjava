<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<title>블랙리스트 등록</title>
<style>
.table-div{
    padding: 20%;
    padding-top: 0;
    }
  .table > tbody {
    vertical-align: middle;
}
h1 {
	margin-top: 30px;

}
</style>
</head>
<body>

	<form action="blacklistinsert.do" method="post">
<div class="table-div">
		
		<table class="table table-hover">
	
			<tr class="table-active">
				<td scope="col">블랙리스트 추가할 아이디:</td>
				<td scope="col"><input type="text" name="memberId" class="form-control" id="inputEmail3" value=""></td>
				
			</tr>
			<tr class="table-active">
				<td scope="col">사유:</td>
				<td scope="col"><textarea name="blacklistReason" class="form-control" id="inputEmail3" rows="3" cols="20"></textarea></td>
			</tr>
				
		</table>
		<input type="submit" value="블랙리스트 등록">
	</div>
	</form>
</body>
</html>