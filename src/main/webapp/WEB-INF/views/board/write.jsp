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
        width: 1200px;
        text-align: center;
    }

</style>

</head>
<body>

<form method="post">
	
	<label>제목</label>
	<input type="text" name="title" /><br />

	<label>작성자</label>
	<input type="text" name="writer" /><br />

<!-- 	<label>내용</label>
	<textarea cols="50" rows="5" name="content"></textarea><br /> -->
	
	<input id="summernote" name="content" /> 
	<button type="submit">작성</button>

</form>

<script>
$(document).ready(function() {
  $('#summernote').summernote();
});
</script>
</body>
</html>