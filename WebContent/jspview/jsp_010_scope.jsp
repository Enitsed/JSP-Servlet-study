<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_010_scope</title>
</head>
<body>
	<%
		/*
		scope(영역)- 데이터를 참조할 수 있도록 저장해놓은 공간
		*/

		// page 영역에 p1이름으로 page값이 저장된다.
		pageContext.setAttribute("p1", "page"); // 현재 페이지에서만 참조가능

		// request 영역에 p2이름으로 request값이 저장된다.
		request.setAttribute("p2", "request"); // 다른페이지에서도 참조가능

		// session 영역에 p3이름으로 session 값이 저장된다.
		session.setAttribute("p3", "session"); // 한 사람의 세션에만 저장

		// application p4 이름으로 application 값이 저장된다.
		application.setAttribute("p4", "application"); // 여러사람에게 공유됨
	%>

	<jsp:forward page="jsp_010_next.jsp" />
</body>
</html>