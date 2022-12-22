<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "model1.vo.*" %>
<%@ page import = "model1.service.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	
	BoardService service = new BoardService();
	int resultRow = service.insertBoardList(board);
	if(resultRow == 1) {
		response.sendRedirect(request.getContextPath() + "/model1/m1BoardList.jsp");
	}
%>