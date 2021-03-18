<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session=""%> --%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	session = request.getSession(true);
	String member_id = request.getParameter("member_id");
	request.getSession().setAttribute("member_id", member_id);
%> --%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		$('#loginGo').click(function() {

				// 입력 값 체크
			if($.trim($('#member_id').val()) == '') {
				alert("아이디를 입력해 주십시오.");
				$('#member_id').focus();
				return;
			} else if ($.trim($('#member_pwd').val()) == '') {
				alert("패스워드를 입력해 주십시오.");
				$('#member_pwd').focus();
				return;
			}

				// 전송
			$('#loginFrm').submit();
			
			});
		});
</script>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<h3>湖</h3>

	<div>
		<a href="/board/list">게시물 목록</a><br /> 
		<a href="/board/write">게시물 작성</a><br /> 
		<a href="/board/home">HOME</a><br />
		<a href="/member/sign_up">회원가입</a>
	</div>

	<br />
	<div>
		<c:choose>
			<c:when test="${empty login.member_id}">
				<form id="loginFrm" name="loginFrm" action="loginCheck" method="post">
					아이디22 : <input type="text" id="member_id" name="member_id" placeholder="ID"><br />
					비밀번호3 : <input type="password" id="member_pwd" name="member_pwd" placeholder="PWD"><br />
					<br />
					<c:if test="${msg == 'fail'}">
						<div>아이디 또는 패스워드가 틀렸습니다.</div>
					</c:if>
					<input type="button" id="loginGo" value="로그인" />
				</form>
			</c:when>
			<c:otherwise>
				<h3>${login.member_id}님 환영합니다.</h3>
				<input type="button" value="로그아웃" onClick="location.href='logout'">
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
