<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_17_sql</title>
</head>
<body>
	<sql:setDataSource var="conn" driver="oracle.jdbc.OracleDriver"
		url="jdbc:oracle:thin://@127.0.0.1:1521:xe" user="hr" password="a1234" />

	<!-- http://localhost:8090/webdemo/el_jstl/jstl_17_sql.jsp?query=ex -->
	<sql:query var="rs" dataSource="${conn }">
		select * from employees where first_name like ?
		<sql:param value="%${param.query }%" />
	</sql:query>

	<!-- 
		Lex LDEHAAN
		
		Alexander AHUNOLD
		
		Alexander AKHOO
		
		Alexis ABULL 
	-->
	<c:forEach items="${rs.rows }" var="data">
		<p>
			<c:out value="${data.first_name }" />
			<c:out value="${data['email'] }" />
		</p>
	</c:forEach>
</body>
</html>