<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	$("#searchBtn").click(function() {
	    // alert($("select :selected").val());
	    // alert($("form input[type='text']").val() );
	    $('form').attr('action', 'list.do');
	    $('form').submit();
	})
	$("[name=searchWord]").val('${pdto.searchWord}');
	switch ('${pdto.searchKey}') {
	case 'all':
	    $('[value=all]').prop('selected', 'selected');
	    $('[name=searchWord]').val('');
	    break;
	case 'subject':
	    $('[value=subject]').prop('selected', 'selected');
	    break;
	case 'writer':
	    $('[value=writer]').prop('selected', 'selected');
	    break;
	case 'content':
	    $('[value=all]').prop('selected', 'selected');
	    break;
	}

    })
</script>
</head>
<body>
	<div class="wrap">
		<p>
			<a href="writeForm.do">글쓰기</a>
		</p>

		<p>
		<form>
			<select name="searchKey">
				<option value="all">검색어를 입력</option>
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="writer">글쓴이</option>
			</select> <input type="text" name="searchWord" /> <input id="searchBtn"
				type="button" value="검색" />
			</p>
		</form>

		<table>
			<tr>
				<th>num</th>
				<th>subject</th>
				<th>writer</th>
				<th>readcount</th>
				<th>file</th>
			</tr>

			<c:forEach items="${requestScope.aList }" var="dto">
				<tr>
					<td>${dto.num }</td>
					<td><c:if test="${dto.re_level!=0 }">
							<img src="../boardview/images/level.gif"
								width="${10*dto.re_level }" />
							<img src="../boardview/images/re.gif" />
						</c:if> <c:url var="link" value="view.do">
							<c:param name="num" value="${dto.num }" />
							<c:param name="pageNum" value="${pdto.currentPage }" />
							<c:param name="searchKey" value="${pdto.searchKey }" />
							<c:param name="searchWord" value="${pdto.searchWord }" />
						</c:url> <a href="${link }"> ${dto.subject }</a></td>
					<td>${dto.writer }</td>
					<td>${dto.readcount }</td>
					<td><c:if test="${!empty dto.upload }">
							<img src="../boardview/images/save.gif" />
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
		<p>
			<!-- 이전 -->
			<c:if test="${pdto.startPage>1 }">
				<a
					href="list.do?pageNum=${pdto.startPage-pdto.blockPage}&searchKey=${pdto.searchKey}&searchWord=${pdto.searchWord}">Prev</a>
			</c:if>
			<!-- 페이지 -->
			<c:forEach begin="${pdto.startPage }" end="${pdto.endPage }" var="i">
				<span><a
					href="list.do?pageNum=${i}&searchKey=${pdto.searchKey}&searchWord=${pdto.searchWord}">
						${i }</a></span>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${pdto.endPage<pdto.totalPage }">
				<a
					href="list.do?pageNum=${pdto.startPage+pdto.blockPage}&searchKey=${pdto.searchKey}&searchWord=${pdto.searchWord}">Next</a>
			</c:if>
		</p>
	</div>

</body>
</html>