<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>

	<h1>Hello World!</h1>
	<p>The time on the server is ${serverTime}.</p>
	
	<br />
	
	<form action="sign_up" method="post">
		<input type="text" name="member_id" placeholder="아이디"><br>
		<input type="password" name="member_pwd" placeholder="비밀번호"><br>
		<button id="sign_up_Go">회원가입</button>
	</form>
</body>
</html>