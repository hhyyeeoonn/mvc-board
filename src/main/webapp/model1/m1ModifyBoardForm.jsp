<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "model1.vo.*" %>
<%@ page import = "model1.service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m1ModifyBoardForm.jsp</title>
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no")); // 랩퍼클래스 Integer ..오토박싱
		
		BoardService service = new BoardService();
		ArrayList<Board> list = service.getBoardOne(no);
		
		
	%>
	<h1>MODEL1 게시글 수정</h1>
	<form action = "<%=request.getContextPath()%>/model1/m1ModifyBoardAction.jsp" method = "post">
		<input type = "hidden" name = "no" value = "<%=no%>">
		<table>
		<%
			for(Board b : list) {
		%>	
				<tr>
					<th>title</th>
					<td>
						<input type = "text" name = "title" value = "<%=b.getTitle()%>">
					</td>
				</tr>
				<tr>
					<th>content</th>
					<td>
						<textarea rows = "5" cols = "50"  name = "content"><%=b.getContent()%></textarea>
					</td>
				</tr>
		<%
			}
		%>
		</table>
		<button type = "submit">수정하기</button>
	</form>
</body>
</html>