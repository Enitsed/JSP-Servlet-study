<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_03_choose</title>
</head>
<body>
	<%
		int avg = 85;
		if (avg >= 90)
			out.print("A");
		else if (avg >= 80)
			out.print("B");
		else if (avg >= 70)
			out.print("C");
		else if (avg >= 60)
			out.print("D");
		else
			out.print("F");
	%>

	<p>if~else 와 switch~case의 혼합형태: choose태그</p>
	<c:set var="avg" value="85"></c:set>
	<c:choose>
		<c:when test="${avg>=90 }">
			<c:out value="A"></c:out>
		</c:when>
		<c:when test="${avg>=80 }">
			<c:out value="B"></c:out>
		</c:when>
		<c:when test="${avg>=70 }">
			<c:out value="C"></c:out>
		</c:when>
		<c:when test="${avg>=60 }">
			<c:out value="D"></c:out>
		</c:when>
		<c:otherwise>
			<c:out value="F"></c:out>
		</c:otherwise>
	</c:choose>
</body>
</html>