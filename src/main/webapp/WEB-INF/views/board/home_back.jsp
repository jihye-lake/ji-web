<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="/resources/navi/Header.jsp" %>
<title>Home</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
</head>
<body>	
	
	
	<div>
		<div style="float:left;width:204px;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		
		</div>
		
		<div style="width:500px;float:right;">
			<select class="form-control" id="select_tags">
				<option value="1">option1</option>
				<option value="2">option2</option>
				<option value="3">option3</option>
				<option value="4">option4</option>
				<option value="5">option5</option>
			</select>
			
			<button id="tuika_option">추가</button>
			
			<span id="tuika_span"></span>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
	<script type="text/javascript">
	// select2 초기화
	$('select').select2();

	$(document).ready(function(){
		
	});
			
		$("#tuika_option").on("click",function(){
			var tags = $("#select_tags option:selected").text();
			var tags_id = $("#select_tags option:selected").val();
			$("#tuika_span").append("<span id='option" + tags_id + "'" + "value='option" + tags_id + "'" + ">" + tags + "</span>");
			});
	
		<% for (int xx=1;xx<6;xx++) { %>
		$(document).on("click","#option<%=xx%>",function(){
			if ($("#option<%=xx%>").text() == "option<%=xx%>"){
				$("#option<%=xx%>").remove();
				}
			});
		<% } %>
	
	</script>
</body>
</html>
