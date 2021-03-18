<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) --> <!-- head 사이에 가져와야 인식됨. 아래쪽 body 에서는 안 됨 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

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