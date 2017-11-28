<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<div class="wrap">
		<p>
			<a href="writeForm.do">글쓰기</a>
		</p>
		<table>
			<tr>
				<th>num</th>
				<th>subject</th>
				<th>writer</th>
				<th>readcount</th>
				<th>file</th>
			</tr>

			<c:forEach items="${requestScope.aList }" var="dto">
				<tr>
					<td>${dto.num }</td>
					<td><c:if test="${dto.re_level!=0 }">
							<img src="../boardview/images/level.gif"
								width="${10*dto.re_level }" />
							<img src="../boardview/images/re.gif" />
						</c:if> <a href="view.do?num=${dto.num }" />${dto.subject }</td>
					<td>${dto.writer }</td>
					<td>${dto.readcount }</td>
					<td>${dto.upload }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>