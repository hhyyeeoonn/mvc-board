<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
	String sql = "DELETE FROM board Where no = ?"; 
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, no);
	int resultRow = stmt.executeUpdate();
	
	if(resultRow == 1) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspBoardList.jsp");
	}
%>
