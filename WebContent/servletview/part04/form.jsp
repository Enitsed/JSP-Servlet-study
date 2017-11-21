<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="problem" method="post">
		<p>1. 대한민국 수도는 어디입니까?</p>
		<p>
			<input type="radio" name="ko" value="부산" checked="checked">
			부산 <input type="radio" name="ko" value="제주"> 제주 <input
				type="radio" name="ko" value="서울"> 서울 <input type="radio"
				name="ko" value="대전"> 대전
		</p>
		<input type="submit" value="commit" />

	</form>
</body>
</html>