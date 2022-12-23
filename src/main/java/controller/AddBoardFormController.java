package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// C -> M ===> 클라이언트 다른 컨트롤러를 요청하도록 리다이렉트
// view(jsp) 파일들을 WEB-INF보안폴더 안으로 이동해서 클라이언트가 View를 직접 호출 못하도록...
// list select					: C -> M -> V 
// form 페이지호출					: C -> V
// action insert/update/delete	: C -> M =====> response.sendRedirect()
@WebServlet("/mvc/mvcAddBoardFormController")
public class AddBoardFormController extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("/WEB-INF/view/mvcAddBoardForm.jsp").forward(request, response);
   }
}