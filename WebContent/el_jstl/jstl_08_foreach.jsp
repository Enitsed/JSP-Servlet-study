<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_08_foreach</title>
</head>
<body>
	<%
		ArrayList<Integer> aList = new ArrayList<Integer>();
		aList.add(new Integer(10));
		aList.add(new Integer(20));
		aList.add(new Integer(30));
		aList.add(new Integer(40));
		aList.add(new Integer(50));
		for (int i = 0; i < aList.size(); i++) {
			out.print(aList.get(i) + " ");
		}

		request.setAttribute("aList", aList);
	%>

	<%-- <c:forEach var="data" items="<%=aList%>"></c:forEach> --%>

	<c:forEach var="data" items="${requestScope.aList }">
		<c:out value="${data }" />
	</c:forEach>

	<hr />
	<%-- varStatus: 반복상태를 갖는 속성이다. --%>

	<c:forEach var="data" items="<%=aList%>" varStatus="status">
		<p>
			count:${status.count } / ${status.index }]:
			<c:out value="${data }" />
		</p>
	</c:forEach>

</body>
</html>