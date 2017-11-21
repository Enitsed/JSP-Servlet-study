<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_006_response</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		if (id.equals("kim") && pwd.equals("1234")) {
	%>
	<!-- 서버에서 페이지 이동 -->
	<jsp:forward page="jsp_006_logout.jsp"></jsp:forward>
	<%
		} else {
			// 서버와 클라이언트에서 페이지 이동
			response.sendRedirect("jsp_006_logout.jsp");
		}
	%>

</body>
</html>