<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resources/navi/Header.jsp" %>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>

	
	<div>
		<div style="float:left;width:204px;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		<div style="position:absolute;left:221px;height:100%;">
			<form action="sign_up" method="post">
				<input type="text" name="member_id" id="member_id" value="" placeholder="아이디">
				<button type="button" id="idChk" value="" onclick="fn_idChk();">아이디 중복확인</button><br>
				<input type="password" name="member_pwd" id="member_pwd" placeholder="비밀번호"><br>
				<input type="password" id="member_pwd_ck" placeholder="비밀번호확인"><br>
				<span id="pwd_ck"></span><br>
				<button id="sign_up">회원가입</button>
			</form>
		</div>
		</div>
	
	</div>
	
<script type="text/javascript">

$(document).ready(function(){	
			
	$("#sign_up").click(function(){
		if ($("#idChk").val()!="Y"){
			alert("아이디 중복확인을 해주십시오.");
			event.preventDefault();
			}
		else if($("#member_id").val()=="") {
			alert("아이디를 입력해 주십시오.");
			$("#idChk").prop("value","");
			event.preventDefault();
			}
		else if($("#member_pwd").val()==""){
			alert("비밀번호를 입력해 주십시오.");
			$("#member_pwd").focus();
			event.preventDefault();
			}
		else if($("#member_pwd_ck").val()==""){
			alert("비밀번호를 확인을 입력해 주십시오.");
			$("#member_pwd_ck").focus();
			event.preventDefault();
			}
		else if($("#member_pwd").val()!=$("#member_pwd_ck").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#member_pwd_ck").focus();
			event.preventDefault();
			}
		});

	
	$("#member_pwd_ck").keyup(function(){
		if ($("#member_pwd").val()=="") {
			if ($("#member_pwd_ck").val()!="") {				
				$("#pwd_ck").text("비밀번호를 입력해 주십시오.").css("color","red");
			}		
		}
		else if ($("#member_pwd").val()!=$("#member_pwd_ck").val()) {
			$("#pwd_ck").text("비밀번호가 일치하지 않습니다.").css("color","red");
			}
		else if ($("#member_pwd").val()==$("#member_pwd_ck").val()) {
			$("#pwd_ck").text("비밀번호가 일치합니다!").css("color","green");
			}
		});
	
});		

	function fn_idChk(){ // 아이디 중복체크 함수 실행(Ajax)
		$.ajax({
			url : "idChk",
			type : "post",
			dataType : "json",
			data : {"member_id" : $("#member_id").val()},

			success : function(data) {
				if($("#member_id").val()=="") {
					$("#idChk").prop("value","");
					alert("아이디를 입력 후 중복확인을 진행해 주십시오.");
					}
				else if(data > 0) {
					$("#idChk").prop("value","");
					alert("중복된 아이디 입니다.");
					}
				else if(data==0) {
					$("#idChk").prop("value","Y");
					alert("사용가능한 아이디입니다.");
					}
				}
			})
		}	
		
</script>
	
</body>
</html>