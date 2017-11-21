<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_004_object</title>
</head>
<body>
	<%--
	 기본객체(내장객체)
	   :웹 컨테이너에서 객체생성해서 제공해주는 객체들이다.
	   (1) request : 클라이언트 정보를 서버에서 받아 처리해주는 객체이다.
	   (2) response :  서버에서 클라이언트에 응답해주는 객체이다.
	   (3) session : 클라이언트의 세션정보를 저장한 객체이다.
	   (4) pageContext : 페이지 실행에 필요한 컨텍스트 정보를 저장한 객체
	   (5) out : 응답 페이지 전송을 위한 출력스트림 객체
	   (6) application : 어플리케이션의 컨텍스트 정보를 저장한 객체
	   (7) config :  해당 페이지의 서블릿 설정 정보
	   (8) page : 해당 페이지 서블릿 객체
	   (9) exception : 예외처리를 위한 객체
	--%>

	<form name="frm" method="post" action="jsp_004_process.jsp">
		<span>name</span> <input type="text" name="fname" /> <input
			type="submit" value="commit" />
	</form>

</body>
</html>