<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_16_function</title>
</head>
<body>
	<%-- jstl에서 제공되는 문자열 함수 --%>
	<c:set var="str1" value="Functions" />
	<c:set var="str2" value="java test" />
	<p>length:${fn:length(str1) }</p>
	<p>toUpperCase:${fn:toUpperCase(str1) }</p>
	<p>replace:${fn:replace(str2,"java","jsp") }</p>
	<p>substring:${fn:substring(str2,6,8) }</p>
	<p>indexOf:${fn:indexOf(str2,"test") }</p>
	<p>contains:${fn:contains(str1,str2) }</p>

	<c:set var="str3" value="red,green,blue" />
	<c:set var="arr" value='${fn:split(str3,",") }' />
	<p>split : ${arr[0] }</p>
	<p>split : ${arr[1] }</p>
	<p>split : ${arr[2] }</p>

	<hr />

	<c:forEach items="${arr }" var="data">
		<p>
			<c:out value="${data }" />
		</p>
	</c:forEach>

</body>
</html>