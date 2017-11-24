<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 이미지 삽입 체크
	$('form').on('submit', function() {
		var str = $('#filepath').val();
		if (str.length < 1) {
			alert("이미지를 선택하세요.");
			return false;
		}
	});

	// 선택한 이미지 img 태그에 보이기
	$('#filepath').on('change', function() {
	    var str = $('#filepath').val();
	    var patt = /(.jpg$|.gif$|.png$)/g; // $ : 문장의 끝을 의미, 끝이 jpg, gif, png 확장자 일 경우
	    var result = str.match(patt);
	    if (!result) {
			alert("jpg, gif, png 파일이 아닙니다.");
			$('filepath').val('');
			return false;
	    }

	    if (this.files && this.files[0]) {
			if (this.files[0].size > 1000000) {
			    alert("1MB 이하만 첨부할 수 있습니다.");
			    $('filepath').val('');
			    return false;
			}

			// 파일을 읽기 위한 FileReader객체 생성
			var reader = new FileReader();
			// File 내용을 읽어 dataURL형식의 문자열로 저장
			reader.readAsDataURL(this.files[0]);
	    }

	    // 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	    reader.onload = function(e) {
			// 이미지 Tag의 src속성에 읽어들인 File내용을 지정
			$('img').attr('src', e.target.result);
	    }
	});
});
</script>
</head>
<body>
	<!-- input요소의 type속성의 값이 "file"이면 method="post" enctype="multipart/form-data"으로 설정한다 -->
	<form name="frm" action="insertMain" method="post"
		enctype="multipart/form-data">
		<!-- form enctype이 multipart일 경우 method는 반드시 post 여야 한다. -->
		<p>
			<img src="" width="100" height="100" />
		</p>
		<p>
			<span>파일</span> <input type="file" name="filepath" id="filepath" />
		</p>
		<input type="submit" value="commit" />
	</form>
</body>
</html>