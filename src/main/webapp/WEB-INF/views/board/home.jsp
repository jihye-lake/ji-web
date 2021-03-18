<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>

<title>Home</title>
</head>
<body>	
	<nav>
		<%@ include file="nav.jsp" %>
	</nav>
	
	<div>
		<a href="../board/list">게시물 목록</a><br /> <a href="../board/write">게시물
			작성</a><br /> <a href="../board/home">HOME</a>
	</div>

	<br />
	<c:if test="${member == null}">
		<form role="form" method="post" autocomplete="off" action="../member/loginCheck">
			아이디 : <input type="text" id="member_id" name="member_id" placeholder="ID"><br /> 
			비밀번호 : <input type="password" id="member_pwd" name="member_pwd" placeholder="PWD"><br /><br />
			<button type="submit">로그인</button>
		</form>
	</c:if>
	
	<c:if test="${member != null}">
		<p>${member.member_id} 님 환영합니다.</p>
		<a href="/member/logout">로그아웃</a>
	</c:if>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){	
		$("#img1").click(function() {
			$("#profile").html('<img src="<spring:url value='/resources/img/sky.jpg'/>" style="width:300px;height:170px;" />')
			});
		$("#img2").click(function() {
			$("#profile").html('<img src="<spring:url value='/resources/img/snack.jpg'/>" style="width:300px;height:170px;" />')
			});
	});		
	
	</script>
	
	<div>
		<img id="img1" src="<spring:url value='/resources/img/sky.jpg'/>" style="width:300px;height:170px;"/>
		<img id="img2" src="<spring:url value='/resources/img/snack.jpg'/>" style="width:300px;height:170px;" />
		<div style="background-color:#234dac;width:300px;height:170px;"><span id="profile"></span></div>
	</div>
</body>
</html>
