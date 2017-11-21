<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_007_pageres</title>
</head>
<body>
	<%
		String color = request.getParameter("color");
		out.print(color);
	%>
</body>
</html>