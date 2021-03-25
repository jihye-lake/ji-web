<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<%@ include file="/resources/Lib/Header.jsp" %>
<style>
    .note-editor{
    }

</style>

</head>
<body>

	<div>
		<div style="float:left;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		</div>
		
		<div style="float:left;margin-left:50px;">
			<form method="post">
				
				<label>제목</label>
				<input type="text" name="title" /><br />
			
				<label>작성자</label>
				<input type="text" name="writer" /><br />
			
			<!-- 	<label>내용</label>
				<textarea cols="50" rows="5" name="content"></textarea><br /> -->
			<!-- <input id="summernote" name="content" />  -->
				<textarea id="summernote" name="content"></textarea> 
				<button type="submit">작성</button>
			
			</form>
		</div>
	</div>

<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote({
        height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	  });
});
</script>
</body>
</html>