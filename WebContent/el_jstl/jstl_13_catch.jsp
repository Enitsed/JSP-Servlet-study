<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_13_catch</title>
</head>
<body>
	<%
		try {
			String data = request.getParameter("data");
			int num = Integer.parseInt(data);
			out.print(num);
		} catch (NumberFormatException ex) {
			out.print(ex.toString());
		}
	%>

	<hr />

	<c:catch var="ex">
		<%
			String data = request.getParameter("data");
				int num = Integer.parseInt(data);
				out.print(num);
		%>
	</c:catch>

	<p>${empty ex ? "ok" : "exception" }</p>
</body>
</html>