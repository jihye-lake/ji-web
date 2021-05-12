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
		<div style="float:left;width:204px;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		<div style="position:absolute;left:221px;height:100%;">
			<c:if test="${member == null}">
				<form role="form" action="./login" method="post" autocomplete="off">
					아이디 : <input type="text" name="member_id" id="member_id" placeholder="아이디" style="width:60px;" onkeyup="saveValue(this);" /><br /> 
					비밀번호 : <input type="password" name="member_pwd" id="member_pwd" placeholder="비밀번호" style="width:60px;" onkeyup="saveValue(this);" /><br /><br />
					<button type="submit" id="login" onclick="fn_login();">로그인</button> <button type="button" onclick="location.href='../member/sign_up'">회원가입</button>
				</form>
			</c:if>
			
			<c:if test="${member != null}">
				<form action="../member/logout">
					<p>${member.member_id} 님 환영합니다.</p>
					<button type="submit" id="logout">로그아웃</button>
				</form>
			</c:if>
		</div>
		</div>
		<div style="float:left;margin-left:50px;width:700px;">			
			<div>
				<img id="img1" src="<spring:url value='/resources/img/sky.jpg'/>" style="width:200px;height:120px;"/>
				<img id="img2" src="<spring:url value='/resources/img/snack.jpg'/>" style="width:200px;height:120px;" />
				<img id="profile" style="background-color:#234dac;width:200px;height:120px;" />
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

	function fn_login(){ // 아이디 중복체크 함수 실행(Ajax)
		$.ajax({
			url : "IdPwChk",
			type : "post",
			dataType : "json",
			data : {"member_id" : $("#member_id").val(),"member_pwd" : $("#member_pwd").val()},

			success : function(data) {
				if($("#member_id").val()=="") {
					alert("아이디를 입력해 주십시오.");
					$("#member_id").focus();
					}
				else if(data==0) {
					alert("아이디 혹은 비밀번호를 확인해 주십시오.");
					$("#member_id").focus();
					}
				else if($("#member_pwd").val()=="") {
					alert("비밀번호를 입력해 주십시오.");
					$("#member_pwd").focus();
					}
				else if(data==1) {
					alert("로그인 되었습니다");
					}
				},
			error: function(jqXHR, exception) {
		        if (jqXHR.status === 0) {
		            alert('Not connect.\n Verify Network.');
		        }
		        else if (jqXHR.status == 400) {
		            alert('Server understood the request, but request content was invalid. [400]');
		        }
		        else if (jqXHR.status == 401) {
		            alert('Unauthorized access. [401]');
		        }
		        else if (jqXHR.status == 403) {
		            alert('Forbidden resource can not be accessed. [403]');
		        }
		        else if (jqXHR.status == 404) {
		            alert('Requested page not found. [404]');
		        }
		        else if (jqXHR.status == 500) {
		            alert('Internal server error. [500]');
		        }
		        else if (jqXHR.status == 503) {
		            alert('Service unavailable. [503]');
		        }
		        else if (exception === 'parsererror') {
		            alert('Requested JSON parse failed. [Failed]');
		        }
		        else if (exception === 'timeout') {
		            alert('Time out error. [Timeout]');
		        }
		        else if (exception === 'abort') {
		            alert('Ajax request aborted. [Aborted]');
		        }
		        else {
		            alert('Uncaught Error.n' + jqXHR.responseText);
		        }
		    }
			})
		}
		

	function saveValue(e){
		var member_id=$("#member_id").val();
		var member_pw=$("#member_pw").val();
		
        var id = e.member_id;  // get the sender's id to save it . 
        var pw = e.member_pw; // get the value. 
        localStorage.setItem(id, pw);// Every time user writing something, the localStorage's value will override . 
    }

	
	</script>
</body>
</html>
