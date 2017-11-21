<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_008_directive_include</title>
</head>
<body>
	<%@ include file="jsp_008_directive_value.jsp"%>

	<%
		// include 지시어 (directive)
		// jsp_008_directive_value.jsp 페이지에 자원을 현재페이지에서 사용할 수 있도록
		// 페이지를 include 한다.
		int x = 20;
		out.print(x + y);
	%>
</body>
</html>