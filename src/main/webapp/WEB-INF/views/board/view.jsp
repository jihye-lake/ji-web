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
				<%@ include file="nav.jsp" %>
			</nav>
		</div>
		
		<div style="float:left;margin-left:50px;">
			<form method="post">
				
				<label>제목</label>
				${view.title}<br />
			
				<label>작성자</label>
				${view.writer}<br />
			
				<label>내용</label>
				${view.content}<br />
				
				<div>
					<a href="../board/modify?bno=${view.bno}">게시물 수정</a>, <a onclick="Delete_Board_Click()">게시물 삭제</a>
				</div>
			
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