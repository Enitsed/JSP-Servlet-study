<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_18_sql</title>
</head>
<body>
	<sql:setDataSource var="conn" driver="oracle.jdbc.OracleDriver"
		url="jdbc:oracle:thin://@127.0.0.1:1521:xe" user="hr" password="a1234" />

	<%-- 	
		<sql:update dataSource="${conn }">
			insert into mem values(mem_num_seq.nextval, ?, ?, ?)
			<sql:param value="test01" />
			<sql:param value="30" />
			<sql:param value="seoul" />
		</sql:update>
	--%>

	<%-- 
		<sql:update dataSource="${conn }">
			update mem set name = ? where num = ?
			<sql:param value="test2" />
			<sql:param value="5" />
		</sql:update>
	--%>

	<sql:update dataSource="${conn }">
			delete from mem where num = ?
			<sql:param value="5" />
	</sql:update>


	<sql:query var="rs" dataSource="${conn }">
		select * from mem order by num
	</sql:query>

	<c:forEach items="${rs.rows }" var="data">
		<p>
			<c:out value="${data['num'] }" />
			_
			<c:out value="${data['name'] }" />
			_
			<c:out value="${data['age'] }" />
			_
			<c:out value="${data['loc'] }" />
		</p>
	</c:forEach>
</body>
</html>