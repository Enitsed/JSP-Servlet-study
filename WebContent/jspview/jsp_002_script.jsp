<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_002_script</title>
</head>
<body>
	<%-- jsp 에서 제공하는 기본 구성요소
	1. 스크립트 요소 : jsp 에서 실시간으로 문서의 내용을 생성하기 위해 사용된다.
		(1) 표현식(expression) : 값을 출력한다. <%= %>
		(2) 스크립트릿(scriptlet) : 자바코드를 실행한다. <% %>
		(3) 선언부(declaration) : 멤버변수, 메소드를 정의한다. <%! %>
	--%>

	<%!int x; // 멤버변수
	int y;

	public void setData(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public int getSum() {
		return x + y;
	}%>

	<%
		int z = 20; // 지역변수
		setData(10, 5);
	%>

	<p>
		<%=getSum()%></p>
	<p><%=x%>/
		<%=z%></p>
</body>
</html>