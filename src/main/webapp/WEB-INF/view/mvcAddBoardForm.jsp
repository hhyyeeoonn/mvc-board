<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 모든 요청은 C를 거친다
	 C -> M -> V 
	 C -> M =====> redirect =====> 다른 컨트롤러 호출
	 C -> V
View만 있는 Model은 존재하지 않는다-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mvcAddBoardForm.jsp</title>
</head>
<body>
	<h1>게시글 입력</h1>
	<form action = "<%=request.getContextPath()%>/jsp/jspAddBoardAction.jsp" method = "post">
		<table>
			<tr>
				<th>title</th>
				<td>
					<input type = "text" name = "title">
				</td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<textarea rows = "5" cols = "50" name = "content"></textarea>
				</td>
			</tr>
		</table>
		<button type = "submit">글 등록</button>
	</form>
</body>
</html>