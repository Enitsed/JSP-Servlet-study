<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	<!-- 스크립트릿(Scriptlet) : 자바소스 -->
	<%
		String fname = (String) request.getAttribute("fname");
	%>

	<!-- 표현식(expression) : 변수나 메소드를 호출해서 출력한다. -->
	<p><%=fname%></p>
</body>
</html>