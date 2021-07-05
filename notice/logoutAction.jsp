<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>홈페이지</title>
</head>
<body>
	<%	
		session.invalidate();
	%>
	<script>
		location.href = 'main.jsp';
	</script>

</body>
</html>