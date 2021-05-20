<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  <!-- 이미지를 불러오기 위한 태그 추가 -->     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) --> <!-- head 사이에 가져와야 인식됨. 아래쪽 body 에서는 안 됨 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
    
    <div style='text-align:center;'>
    	<img src="<spring:url value='/resources/img/sky.jpg'/>" /> <!-- 이미지 경로 유의 -->
		
		<P>The time on the server is ${serverTime}.</P>
	
		<h3>湖</h3>
	
		<hr>
	</div>
	
</body>
</html>