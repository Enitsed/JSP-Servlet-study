<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_19_xml</title>
</head>
<body>
	<c:import url="mem.xml" var="mem" charEncoding="UTF-8" />
	<x:parse var="xmldata" xml="${mem }" />
	<x:forEach select="$xmldata//student">
		<p>
			<x:out select="./name" />
			/
			<x:out select="./id" />
			/
			<x:out select="./age" />
		</p>
	</x:forEach>

</body>
</html>