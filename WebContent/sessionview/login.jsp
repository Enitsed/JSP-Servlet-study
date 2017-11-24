<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	var chk = '${chk}'; // ${sessionScope.chk}

	if (chk == 2) {
	    alert('아이디 비밀번호를 확인하세요.');
	}

	$('form').submit(function() {
	    if ($('#fid').val() == '') {
		alert('아이디를 입력하세요.');
		return false;
	    }

	    if ($('#fpass').val() == '') {
		alert('비밀번호를 입력하세요.');
		return false;
	    }
	});
    });
</script>
</head>
<body>

	<c:choose>
		<c:when test="${empty chk || chk==2}">
			<div class="login">
				<form action="login" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="fid" id="fid"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="fpass" id="fpass"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="로그인"> <input type="reset" value="취&nbsp;&nbsp;소"></td>
						</tr>
					</table>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="logout">
				<a href="logout">로그아웃</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>




