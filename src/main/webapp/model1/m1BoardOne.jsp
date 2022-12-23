<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "model1.vo.*"%>
<%@ page import = "model1.service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m1BoardOne.jsp</title>
</head>
<body>
	<h1>MODEL1 BOARD CONTENT</h1>
	<%
		int no = Integer.parseInt(request.getParameter("no")); // 랩퍼클래스 Integer ..오토박싱
		
		BoardService service = new BoardService();
		ArrayList<Board> list = service.getBoardOne(no);
	%>
	<table border = "1">
	<%
		for(Board b : list) { //여러개가 아닌 하나만 가져오는 거니까 
	%>
			<tr>
				<th>title</th>
				<td>
					<%=b.getTitle()%>			
				</td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<%=b.getContent()%>
				</td>
			</tr>
	<%
		}
	%>
	</table>
	<div>
		<span>
		<a href = "<%=request.getContextPath()%>/model1/m1ModifyBoardForm.jsp?no=<%=no%>">
			<button type = "button">수정하기</button>
		</a>
		</span>
		<a href = "<%=request.getContextPath()%>/model1/m1RemoveBoardAction.jsp?no=<%=no%>">
			<button type = "button">삭제하기</button>
		</a>
		
		<a href = "<%=request.getContextPath()%>/model1/m1BoardList.jsp">
			<button type = "button">글목록으로</button>
		</a>
	</div>
</body>
</html>