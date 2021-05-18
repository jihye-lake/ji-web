<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  <!-- 이미지를 불러오기 위한 태그 추가 -->
<ul>

	<li>
		<a href="../board/listPage?num=1">글 목록(페이징)</a>
	</li>
	
	<li>
		<a href="../board/list">게시물 목록</a>
	</li>
	
	
	<li>
		<a href="../img_board/img_list">사진 목록</a>
	</li>
	
	<li>
		<a href="../board/write">게시물 작성</a>
	</li>	
	
	<li>
		<a href="../board/garbage">휴지통</a>
	</li>
	
	<li>
		<a href="../board/home">HOME</a>
	</li>
	
	<c:if test="${member.member_id == 'admin'}">
		<li>
			<a href="../admin/manage">관리자 페이지</a>
		</li>
	</c:if>
	
</ul>