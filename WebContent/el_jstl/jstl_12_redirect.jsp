<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_12_redirect</title>
</head>
<body>
	<%-- sendRedirect()와 같은 기능을 제공해 주는 태그 --%>
	<p>current page</p>
	<%-- <c:redirect url="/el_o3.jsp" context="/webdemo/el_jstl" /> 절대경로 --%>

	<c:redirect url="el_03.jsp" />
	<%-- 상대경로 --%>

</body>
</html>