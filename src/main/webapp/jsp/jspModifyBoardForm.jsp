<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspModifyBoardForm.jsp</title>
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no")); // 랩퍼클래스 Integer ..오토박싱
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
		String sql = "SELECT title, content FROM board WHERE no = ?"; //ORDER BY 없다면 no, 인덱스키에 의해 자동정렬
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, no);
		ResultSet rs = stmt.executeQuery();
	%>
	<h1>게시글 수정</h1>
	<form action = "<%=request.getContextPath()%>/jsp/jspModifyBoardAction.jsp" method = "post">
		<input type = "hidden" name = "no" value = "<%=no%>">
		<table>
		<%
			if(rs.next()) {
		%>	
				<tr>
					<th>title</th>
					<td>
						<input type = "text" name = "title" value = '<%=rs.getString("title")%>'>
					</td>
				</tr>
				<tr>
					<th>content</th>
					<td>
						<textarea rows = "5" cols = "50"  name = "content"><%=rs.getString("content")%></textarea>
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