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
		}
		return list;
	}
	
	public 
	
}
