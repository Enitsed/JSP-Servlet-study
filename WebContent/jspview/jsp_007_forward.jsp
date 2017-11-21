<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_007_forward</title>
</head>
<body>
	<%!String colorName = "blue";%>
	<%-- <jsp:param value="red" name="color" /> --%>

	<jsp:forward page="jsp_007_pageres.jsp">
		<jsp:param value="<%=colorName%>" name="color" />
	</jsp:forward>
	<!-- name 속성은 변수를 이용할 수 없다. -->

</body>
</html>