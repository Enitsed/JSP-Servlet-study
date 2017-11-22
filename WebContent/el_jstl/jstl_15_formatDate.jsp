<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_15_formatDate</title>
</head>
<body>
	<%-- 
		value : 포맷할 날짜 및 시간
		type : 날짜, 시간 또는 둘다 포맷팅 할지의 여부를 지정한다. time, date, both중 한 가지 값을
		   가질 수있으며, 기본 값은 date이다.
		dateStyle: 날짜에 대해 미리 정의된 포맷팅스타일을 지정한다.
		           default, short, medium, long, full중 한가지 값을 가질수 이다. 
		timeStyle : 시간에 대해 미리 정의된 포맷팅 스타일을 지정한다.
		            default, short, medium, long, full중 한가지 값을 가질 수 있다.
		pattern : 직접 파싱할때 사용할 양식을 지정한다. 
		           javax.text.DateFormat에 있는 양식을 사용한다.
		timeZone : 시간대를 변경하고 싶을때 사용한다.
		           <fmt:setTimeZone>태그에서 생성한 TimeZone태그를 사용한다.
		var : 파싱할 결과를 저장할 변수명을 지정한다.
		scope: 변수를 저장할 영역을 지정한다. 기본값은 page이다.  
	--%>
	<c:set var="today" value="<%=new Date()%>" />

	<fmt:formatDate value="${today }" type="both" dateStyle="default"
		timeStyle="default" />

	<br />

	<fmt:formatDate value="${today }" type="both"
		pattern="yyyy-MM-dd HH:mm:ss" />

</body>
</html>