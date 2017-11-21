<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_003_directive</title>
</head>
<body>
	<%-- 
	JSP에서 제공하는 기본 구성요소
	2. directive(지시어) : jsp 파일 내에서 jsp를 실행할 컨테이너에서 해당페이지를 처리하는데 필요한
	정보를 제공해준다. <%@ %>
	(1) page : jsp페이지에 대한 속성을 지정하는 지시어이다.
	(2) include : 여러 jsp 페이지에서 공통으로 사용되는 값을 지정할 때 사용하는 지시어이다.
	(3) taglib : 사용자 정의 태그를 등록할때 사용되는 지시어이다.
	--%>

	<%
		Calendar cal = Calendar.getInstance();
	%>
	<%=cal%>
</body>
</html>