<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_01</title>
</head>
<body>
	<%-- 
		EL(Expression Language) : 표현 언어
		1. JSP 스크립트를 대신해서 속성값들을 편리하게 출력할 수 있도록 제공되는 언어이다.
		2. ${}
	--%>
	<%
		// page 영역에 p1이름으로 page값이 저장된다.
		pageContext.setAttribute("p1", "page");
		// 현재 페이지에서만 참조가능

		// request 영역에 p2이름으로 request값이 저장된다.
		request.setAttribute("p2", "request");
		// 다른페이지에서도 참조가능 a.jsp 페이지에서 request영역에 저장된것은 b.jsp에서도 참조 가능

		// session 영역에 p3이름으로 session 값이 저장된다.
		session.setAttribute("p3", "session");
		// 한 사람의 세션에만 저장(ex> 로그인) * 로그인 상태를 유지하기위해

		// application p4 이름으로 application 값이 저장된다.
		application.setAttribute("p4", "application");
		// 여러사람에게 공유됨 (ex> 방문회수, 통계) * 데이터가 저장되지 않아 보통 DB를 이용한다.
	%>

	<p>${pageScope.p1}/${requestScope.p2}/${sessionScope.p3}/
		${applicationScope.p4}</p>

	<!-- scope에 저장된 것은 이름만으로 가져 올수 있음.
	 page~application영역까지 하나하나 검사해서 가져옴 -->
	<!-- 속성값을 가져올때 영역을 명시하지 않으면 
	page -> request -> session -> application 순으로 검색을 한다. -->

	<p>${p3}</p>

</body>
</html>