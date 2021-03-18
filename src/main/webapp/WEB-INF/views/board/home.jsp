<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="/resources/Lib/Header.jsp" %>
<title>Home</title>
</head>
<body>	
	
	
	<div>
		<div style="float:left;">
			<nav>
				<%@ include file="nav.jsp" %>
			</nav>
		<div style="margin-top:100px;">
			<c:if test="${member == null}">
				<form role="form" method="post" autocomplete="off" action="../member/loginCheck">
					아이디 : <input type="text" id="member_id" name="member_id" placeholder="ID" style="width:60px;"><br /> 
					비밀번호 : <input type="password" id="member_pwd" name="member_pwd" placeholder="PWD" style="width:60px;"><br /><br />
					<button type="submit">로그인</button>
				</form>
			</c:if>
			
			<c:if test="${member != null}">
				<p>${member.member_id} 님 환영합니다.</p>
				<a href="../member/logout">로그아웃</a>
			</c:if>
		</div>
		</div>
		<div style="float:left;margin-left:50px;">			
			<div>
				<img id="img1" src="<spring:url value='/resources/img/sky.jpg'/>" style="width:300px;height:170px;"/>
				<img id="img2" src="<spring:url value='/resources/img/snack.jpg'/>" style="width:300px;height:170px;" />
				<img id="profile" style="background-color:#234dac;width:300px;height:170px;" />
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	$(document).ready(function(){	
		$("#img1").click(function() {
			$("#profile").attr('src','<spring:url value="/resources/img/sky.jpg"/>')
			});
		$("#img2").click(function() {
			$("#profile").attr('src','<spring:url value="/resources/img/snack.jpg"/>')
			});
	});		
	
	</script>
</body>
</html>
