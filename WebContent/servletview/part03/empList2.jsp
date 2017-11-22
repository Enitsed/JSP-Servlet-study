<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList2</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>employee_id</th>
				<th>first_name</th>
				<th>salary</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${requestScope.aList }">
				<tr>
					<td><c:out value="${dto.employee_id }" /></td>
					<td><c:out value="${dto.first_name }" /></td>
					<td><c:out value="${dto.salary }" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>