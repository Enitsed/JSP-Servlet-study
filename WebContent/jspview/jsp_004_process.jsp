<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_004_process</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String fname = request.getParameter("fname");
	%>
	<p><%=fname%></p>
</body>
</html>