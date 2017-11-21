<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_005_out</title>
</head>
<body>
	<%
		//클라이언트에서 전송해준 데이터를 받는다.
		String x = request.getParameter("x");
		String ope = request.getParameter("ope");
		String y = request.getParameter("y");

		int numX = Integer.parseInt(x);
		int numY = Integer.parseInt(y);
		int res = 0;

		switch (ope) {
		case "+":
			res = numX + numY;
			out.print(x + "+" + y + "=" + res);
			break;
		case "-":
			res = numX - numY;
			out.print(x + "-" + y + "=" + res);
			break;
		case "*":
			res = numX * numY;
			out.print(x + "*" + y + "=" + res);
			break;
		case "/":
			res = numX / numY;
			out.print(x + "/" + y + "=" + res);
			break;
		}
	%>
</body>
</html>