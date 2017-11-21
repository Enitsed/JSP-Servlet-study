<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_02</title>
</head>
<body>
	<form action="el_02_res.jsp" method="get">
		<p>
			<span>data</span> <input type="text" name="data" />
		</p>

		<p>
			<span>location</span> <input type="checkbox" name="chk" value="서울">서울
			<input type="checkbox" name="chk" value="부산">부산 <input
				type="checkbox" name="chk" value="대전">대전
		</p>
		<input type="submit" value="commit" />
	</form>
</body>
</html>