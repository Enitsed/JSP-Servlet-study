<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_010_next</title>
</head>
<body>
	<p>
		page:<%=pageContext.getAttribute("p1")%>
	</p>

	<p>
		request:<%=request.getAttribute("p2")%>
	</p>

	<p>
		session:<%=session.getAttribute("p3")%>
	</p>

	<p>
		application:<%=application.getAttribute("p4")%>
	</p>

</body>
</html>