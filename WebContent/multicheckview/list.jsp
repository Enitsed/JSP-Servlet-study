<%@page import="multicheckdemo.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<!-- 체크박스 전체 선택 및 삭제 -->
<style type="text/css">
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	// 전체 선택 및 전체 해제
	$('.check_all').click(function() {
	    $('.chk').prop('checked', this.checked);
	})
	$('button').click(function() {
	    var cnt = $('.chk:checked');
	    if (cnt.length == 0) {
		alert("삭제할 데이터를 선택하세요");
		return false;
	    }
	    $('form').submit();
	})

    })
</script>
</head>
<body>

	<div class="wrap">
		<form action="multi" method="post">
			<button>삭제</button>

			<table>
				<tr>
					<th><input type="checkbox" class="check_all" id="check_all" />
						<label for="check_all">전체선택 </label></th>
					<th>num</th>
					<th>name</th>
					<th>age</th>
					<th>loc</th>
				</tr>

				<c:forEach items="${requestScope.aList}" var="dto">
					<tr>
						<td><input type="checkbox" name="chk" class="chk"
							value="${dto.num}" /></td>
						<td>${dto.num}</td>
						<td>${dto.name}</td>
						<td>${dto.age}</td>
						<td>${dto.loc}</td>
					</tr>
				</c:forEach>
			</table>

		</form>
	</div>
</body>
</html>