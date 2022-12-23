package model1.dao;

import java.sql.*;
import java.util.*;
import model1.vo.Board;

public class BoardDao {
	// public ResultSet selectBoardList() throws Exception
	// ResultSet 반환타입으로 별로.. -> 좀 더 보편적이고 평범한 타입으로 : List
	public ArrayList<Board> selectBoardList(Connection conn) throws Exception {
		//다른 메소드에서도 동일한 매개값을 사용하는 코드 중복 
		// -> 매개값(ex: db비밀번호)이 변경되면 중복된 코드 모두 이 매개값을 같은 값으로 일일이 변경해야함
		//Class.forName("org.mariadb.jdbc.Driver");
		//Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
		
		String sql = "SELECT no, title, content FROM board"; //ORDER BY 없다면 no, 인덱스키에 의해 자동정렬
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		// ResultSet -> List 가공작업
		ArrayList<Board> list = new ArrayList<Board>();
		//List<Board> list = new ArrayList<Board>(); 
		while(rs.next()) {
			Board b = new Board();
			b.setNo(rs.getInt("no"));
			b.setTitle(rs.getString("title"));
			b.setContent(rs.getString("content"));
			list.add(b);
		}
		return list;
	}
	
	// insertBoardList - m1AddboardAction.jsp
	public int insertBoardList(Connection conn, Board board) throws Exception { //예외 처리는 BoardService에서 해줄거임
		int row = 0;
		String sql = "INSERT INTO board(title, content) VALUES(?, ?)"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getTitle());
		stmt.setString(2, board.getContent());
		row = stmt.executeUpdate();
		return row;
	}
	
	// ArrayList<Board> getBoardOne - m1ModifyBoardForm.jsp
	public ArrayList<Board> selectBoardOne(Connection conn, int no) throws Exception {
		String sql = "SELECT title, content FROM board WHERE no = ?"; //ORDER BY 없다면 no, 인덱스키에 의해 자동정렬
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, no);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Board> list = new ArrayList<Board>();
		if(rs.next()) {
			Board b = new Board();
			b.setTitle(rs.getString("title"));
			b.setContent(rs.getString("content"));
			list.add(b);
		}
		return list;
	}
	
	// modifyBoardList - m1ModifyBoardAction.jsp
	public int modifyBoardList(Connection conn, Board board) throws Exception {
		int row = 0;
		String sql = "UPDATE board SET title = ?, content = ? WHERE no = ?"; //ORDER BY 없다면 no, 인덱스키에 의해 자동정렬
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getTitle());
		stmt.setString(2, board.getContent());
		stmt.setInt(3, board.getNo());
		row = stmt.executeUpdate();	
		return row;
	}
	
	// removeBoardList - m1RemoveBoardAction.jsp
	public int removeBoardList(Connection conn, int no) throws Exception {
		int row = 0;
		String sql = "DELETE FROM board WHERE no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, no);
		row = stmt.executeUpdate();
		return row;
	}
}
