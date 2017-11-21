<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>input.jsp</title>
<style type="text/css">
img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<form action="game" method="post">
		<p>
			<img src="servletview/images/math_img_1.jpg" /> <input type="radio"
				name="gg" value="가위" checked="checked">
		</p>

		<p>
			<img src="servletview/images/math_img_2.jpg" /> <input type="radio"
				name="gg" value="바위">
		</p>
		<p>
			<img src="servletview/images/math_img_3.jpg" /> <input type="radio"
				name="gg" value="보">
		</p>
		<input type="submit" value="start" />
	</form>
</body>
</html>







