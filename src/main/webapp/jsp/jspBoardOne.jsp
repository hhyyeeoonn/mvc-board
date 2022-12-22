<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspBoardOne.jsp</title>
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
	<table border = "1">
	<%
		if(rs.next()) { //여러개가 아닌 하나만 가져오는 거니까 
	%>
			<tr>
				<th>title</th>
				<td>
					<%=rs.getString("title")%>			
				</td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<%=rs.getString("content")%>
				</td>
			</tr>
	<%
		}
	%>
	</table>
	<div>
		<a href = "<%=request.getContextPath()%>/jsp/jspModifyBoardForm.jsp?no=<%=no%>">
			<button type = "button">수정하기</button>
		</a>
		
		<a href = "<%=request.getContextPath()%>/jsp/jspRemoveBoard.jsp?no=<%=no%>">
			<button type = "button">삭제하기</button>
		</a>
	</div>
</body>
</html>