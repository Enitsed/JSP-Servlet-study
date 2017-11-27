<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeform</title>
<style type="text/css">
input:type {
	width: 100px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<div class="wrap">
		<form action="writeForm.do" name="frm">
			<legend>제목</legend>
			<input type="text" placeholder="제목" />

			<textarea rows="100" cols="100"></textarea>
			<input type="submit" />
		</form>
	</div>
</body>
</html>