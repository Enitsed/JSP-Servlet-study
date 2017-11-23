<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<!-- input요소의 type속성의 값이 "file"이면 method="post" enctype="multipart/form-data"으로 설정한다 -->
	<form name="frm" action="insertMain" method="post"
		enctype="multipart/form-data">
		<!-- form enctype이 multipart일 경우 method는 반드시 post 여야 한다. -->
		<p>
			<span>파일</span> <input type="file" name="filepath" id="filepath" />
		</p>
		<input type="submit" value="commit" />
	</form>
</body>
</html>