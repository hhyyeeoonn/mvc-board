<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "model1.vo.*"%>
<%@ page import = "model1.service.*"%>
<!-- Client가 실제로 호출하는 것 -->
<%
	BoardService boardService = new BoardService();
	ArrayList<Board> list = boardService.getBoardList();
	
	
	// view와 공유할 모델데이터 설정
	request.setAttribute("list", list);
	
	// view 연결 
	// RequestDispatcher 1) include : 둘 다 뷰가 있어 합쳐질 내용이 있을 때  2)forward : 한쪽에 뷰가 없어 합칠 필요가 없을 때
	RequestDispatcher rd = request.getRequestDispatcher("/mvc/mvcBoardList.jsp");
	rd.forward(request, response);
	
	// 컨트롤러를 jsp로 만들 이유가 없다 -> 서블릿으로 만들자
%>