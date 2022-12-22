<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
	String sql = "INSERT INTO board(title, content) VALUES(?, ?)"; 
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, title);
	stmt.setString(2, content);
	int resultRow = stmt.executeUpdate();

	/*
		client에게 재요청(redirect)
		server에서 서버자원에게 부탁(forword/ include)
	
	*/
	// 뷰가 없다
	if(resultRow == 1) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspBoardList.jsp");
	}
%>