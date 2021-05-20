<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/navi/Header.jsp" %>
<title>게시물 목록</title>
</head>
<body>

	<div>
		<div style="float:left;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		</div>
		
		<div style="float:left;margin-left:50px;">
			<div style="text-align:right;">
				<input type='button' onclick="javascript:location.href='../img_board/img_write'" value='이미지 작성' />
			</div>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><input type='checkbox' id='CheckAll' /></th>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td><input type='checkbox' id='Check_${list.m_bno}' class='Check_List' value='${list.m_bno}' /></td>
							<td>${list.m_bno}</td>
							<td><a href="../board/view?m_bno=${list.m_bno}">${list.m_title}</a></td>
							<td>${list.regDate}</td>
							<td>${list.m_writer}</td>
							<td>${list.viewCnt}</td>
						</tr>
					</c:forEach>					
				</tbody>
			</table>
				<div style="text-align:right;">
					<input type='button' id='DButton_List1' onclick="DButton_List1()" value='삭제' />
				</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#CheckAll").click(function() {
			
			<c:forEach items="${list}" var="list">
			
			if($("#CheckAll").prop("checked")) 
				{
					$("#Check_${list.m_bno}").prop("checked",true);
					$("#DButton_List1").val("전체 삭제");
				}
			else 
				{
					$("#Check_${list.m_bno}").prop("checked",false);
					$("#DButton_List1").val("삭제");
				}
			
			</c:forEach>
			});		
		
		$(".Check_List").click(function() {
			
			if($(".Check_List:checked").length == $(".Check_List").length) 
			{
				$("#CheckAll").prop("checked",true);
				$("#DButton_List1").val("전체 삭제");
			}
			else
			{
				$("#CheckAll").prop("checked",false);
				$("#DButton_List1").val("삭제");
			}
		
			});		
	});
	</script>
	
</body>
</html>