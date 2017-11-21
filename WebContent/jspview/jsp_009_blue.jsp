<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_009_blue</title>
<link rel="stylesheet" href="css/common.css" />
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="jsp_009_top.jsp" />
		</header>

		<section class="main_left">
			<nav>
				<jsp:include page="jsp_009_menu.jsp" />
			</nav>
		</section>

		<section class="main_right">
			<div style='background-color: blue; height: 490px'>red page</div>
		</section>

		<footer>
			<jsp:include page="jsp_009_bottom.jsp" />
		</footer>
	</div>

</body>
</html>
