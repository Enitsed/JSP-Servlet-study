<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_02_if</title>
</head>
<body>
	<%
		int num = 10;
		if (num % 2 == 0)
			out.print("even");
		if (num % 2 == 1)
			out.print("odd");
	%>

	<hr />

	<%--
		<c:if test="${조건식}" var="변수명" scope="범위"></c:if>
			: var, scope는 생략할 수 있다.
			scope 생략하면 기본 값은 page이다.
	--%>

	<c:set var="num" value="10" />
	<c:if test="${num%2==0 }">
		<c:out value="even" />
	</c:if>

	<c:if test="${num%2==1 }">
		<c:out value="odd" />
	</c:if>


</body>
</html>