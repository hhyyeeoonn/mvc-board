<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m1AddBoardForm.jsp</title>
</head>
<body>
	<h1>MODEL1 게시글 입력</h1>
	<form action = "<%=request.getContextPath()%>/model1/m1AddBoardAction.jsp" method = "post">
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