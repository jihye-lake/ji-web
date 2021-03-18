<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  <!-- 이미지를 불러오기 위한 태그 추가 -->     
    
    <div style='text-align:center;'>
    	<img src="<spring:url value='/resources/img/sky.jpg'/>" /> <!-- 이미지 경로 유의 -->
		<h1>Hello world!</h1>
		
		<P>The time on the server is ${serverTime}.</P>
	
		<h3>湖</h3>
	
		<hr>
	</div>
	
<ul>

	<li>
		<a href="/board/listPage?num=1">글 목록(페이징)</a>
	</li>
	
	<li>
		<a href="/board/list">글 목록</a>
	</li>
	
	<li>
		<a href="/board/write">글 작성</a>
	</li>
	
</ul>