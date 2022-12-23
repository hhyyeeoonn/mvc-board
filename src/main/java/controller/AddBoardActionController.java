package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.service.BoardService;
import model1.vo.*;

// C -> M 클라이언트가 다른 컨트롤러를 요청하도록 리다이렉트
@WebServlet("/mvc/AddBoardActionController")
public class AddBoardActionController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println("AddBoardActionController.doPost.title :"+title);

		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		
		BoardService service = new BoardService();
		int resultRow = service.insertBoardList(board);
		if(resultRow == 1) {
			response.sendRedirect(request.getContextPath() + "/model1/m1BoardList.jsp");
		}
		
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
