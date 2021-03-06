<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="/resources/navi/Header.jsp" %>
<title>Home</title>
</head>
<body>	
	
	
	<div>
		<div style="float:left;width:204px;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		<div style="position:absolute;left:221px;height:100%;">
<!-- 		
			<c:if test="${member == null}">
				<form role="form" action="./login" method="post" autocomplete="off">
					아이디 : <input type="text" name="member_id" id="member_id" placeholder="아이디" style="width:60px;" onkeyup="saveValue(this);" /><br />
					<span id="idTxt"></span><br>
					비밀번호 : <input type="password" name="member_pwd" id="member_pwd" placeholder="비밀번호" style="width:60px;" onkeyup="saveValue(this);" /><br /><br />
					<button type="submit" id="login" onclick="fn_login();">로그인</button> <button type="button" onclick="location.href='../member/sign_up'">회원가입</button>
				</form>
			</c:if>
 -->			
			<c:if test="${fn:substring(member.member_id,0,5) != 'admin'}">
				페이지에 오류가 발생했습니다.<br>값을 불러오지 못 했습니다.<br>관리자에게 문의해 주십시오.<br><br>
				<button type="button" onclick="location.href='../board/home'">홈으로 돌아가기</button>
			</c:if>
			
			<c:if test="${fn:substring(member.member_id,0,5) == 'admin'}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><input type='checkbox' id='CheckAll' /></th>
						<th>번  호</th>
						<th>제  목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<c:forEach items="${mlist}" var="mlist">
					<tr>
						<td><input type='checkbox' class='Check_List' value='${mlist.member_id}' /></td>
						<td>${mlist.member_id}</td>
						<td>${mlist.member_pwd}</td>
						<td>${mlist.member_id}</td>
						<td>${mlist.member_pwd}</td>
						<td>${mlist.member_id}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
		</div>
<!-- 		
		<div style="float:left;margin-left:50px;width:700px;">			
			<div>
				<img id="img1" src="<spring:url value='/resources/img/sky.jpg'/>" style="width:200px;height:120px;"/>
				<img id="img2" src="<spring:url value='/resources/img/snack.jpg'/>" style="width:200px;height:120px;" />
				<img id="profile" style="background-color:#234dac;width:200px;height:120px;" />
			</div>
		</div>
 -->		
	</div>
<script type="text/javascript">

$(document).ready(function(){	
			
	$("#member_info").click(function(){
		if($("#member_pwd").val()==""){
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
