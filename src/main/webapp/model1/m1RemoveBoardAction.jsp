<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "model1.vo.*" %>
<%@ page import = "model1.service.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardService boardService = new BoardService();
	int resultRow = boardService.removeBoardList(no);
	if(resultRow == 1) {
		response.sendRedirect(request.getContextPath() + "/model1/m1BoardList.jsp");
	}
%>
