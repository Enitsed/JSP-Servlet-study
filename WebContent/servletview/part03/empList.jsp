<%@page import="servletdemo.part03.EmployeesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<EmployeesDTO> aList = (ArrayList<EmployeesDTO>) request.getAttribute("aList");
	%>
	<table>
		<thead>
			<tr>
				<th>employee_id</th>
				<th>first_name</th>
				<th>salary</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < aList.size(); i++) {
					EmployeesDTO dto = aList.get(i);
			%>
			<tr>
				<td><%=dto.getEmployee_id()%></td>
				<td><%=dto.getFirst_name()%></td>
				<td><%=dto.getSalary()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>