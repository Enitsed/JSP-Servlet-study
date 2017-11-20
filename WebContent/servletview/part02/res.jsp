<%@page import="servletdemo.part02.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberDTO dto = (MemberDTO) request.getAttribute("dto");
	%>

	<p><%=dto.getFid()%>
		/
		<%=dto.getFpass()%></p>
</body>
</html>