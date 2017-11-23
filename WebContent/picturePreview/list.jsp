<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	border: 0
}

div.wrap {
	width: 606px;
	margin: auto;
}

div.line {
	width: 200px;
	height: 220px;
	border: 1px solid black;
	margin-bottom: 10px;
	float: left
}

.chk {
	float: left;
	width: 20px;
	height: 20px;
}

p {
	float: left;
	width: 150px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<a href="insertMain">이미지 삽입</a>
	<h3>이미지 목록</h3>
	<div class="wrap">
		<button>이미지 삭제</button>
		<form action="testDel" method="post">
			<c:forEach items="${requestScope.aList }" var="dto">
				<div class="line">
					<img src="../images/${dto.filepath }" width="200" height="200" />
					<input type="checkbox" name="chk" class="chk" value="${dto.num }">
					<p>${dto.filepath }</p>
				</div>
			</c:forEach>
		</form>
	</div>


</body>
</html>