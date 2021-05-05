<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<%@ include file="/resources/Lib/Header.jsp" %>
</head>
<body>

	<div>
		<div style="float:left;">
			<nav>
				<%@ include file="../header/nav.jsp" %>
			</nav>
		</div>
		
		<div style="float:left;margin-left:50px;">
			<form method="post">
				<table class="table table-bordered">
				<tr>
					<th>				
						<label>제목</label>
					</th>
					<td>
						${view.title}<br />
					</td>
				</tr>
				<tr>
					<th>
						<label>작성자</label>
					</th>
					<td>
						${view.writer}<br />
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<label>내용</label>
					</th>
				</tr>
				<tr>
					<td colspan="2">
						${view.content}<br />
					</td>
					
				</tr>
				<tr>
					<td>
						
							<a href="../board/modify?bno=${view.bno}">게시물 수정</a></td><td><a onclick="Delete_Board_Click()">게시물 삭제</a>
						</td>
						
				</tr>
				</table>
			
			</form>
		</div>
	</div>
<script type="text/javascript">

function Delete_Board_Click() {
	if (confirm("정말 삭제하시겠습니까?") == true)
		{
			alert("성공적으로 삭제되었습니다.");
			location.replace("../board/delete?bno=${view.bno}");
		}
	else
		return;
}

</script>
</body>
</html>