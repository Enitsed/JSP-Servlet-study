<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.jsp</title>
</head>
<body>
	<fieldset>
		<legend>로그인</legend>
		<form method="post" action="loginPro">
			<label for="fid">아이디</label> <input type="text" name="fid" id="fid" />
			<label for="fpass">비밀번호</label> <input type="password" name="fpass"
				id="fpass" /> <input type="submit" value="login" />
		</form>
	</fieldset>

</body>
</html>




