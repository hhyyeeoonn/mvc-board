package model1.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import model1.dao.BoardDao;
import model1.util.DBUtil;
import model1.vo.Board;

// 서비스
// 1) 예외처리 -> db자원 반납, 트랜잭션 처리
// 2) Connection객체를 dao에 넘겨주는 역할
// 3) 기타 dao 안에 있어서는 안되는 비지니스로직(코드)
public class BoardService {
	private BoardDao boardDao;
	
	// m1BoardList.jsp
	public ArrayList<Board> getBoardList() {
		boardDao = new BoardDao();
		Connection conn = null;
		ArrayList<Board> list = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			list = boardDao.selectBoardList(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// m1AddBoardAction.jsp
	public int insertBoardList(Board board) {
		boardDao = new BoardDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			row = boardDao.insertBoardList(conn, board);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// m1ModifyBoardform.jsp
	public ArrayList<Board> getBoardOne(int no) {
		boardDao = new BoardDao();
		Connection conn = null;
		ArrayList<Board> list = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			list = boardDao.selectBoardOne(conn, no);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// m1ModifyBoardAction.jsp
	public int modifyBoardList(Board board) {
		boardDao = new BoardDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false); // 자동커밋막기
			row = boardDao.modifyBoardList(conn, board);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// m1RemoveBoardActon.jsp
	public int removeBoardList(int no) {
		boardDao = new BoardDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			row = boardDao.removeBoardList(conn, no);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}
