package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;

public class BoardDAO {

	public static int insert(String btitle, String bwriter, String bcontent) throws NamingException, SQLException {
		
		String sql = "INSERT INTO board (btitle, bwriter, bcontent) VALUES(?, ?, ?)";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, btitle);
		pstmt.setString(2, bwriter);
		pstmt.setString(3, bcontent);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	
	public static ArrayList<BoardDTO> getList() throws SQLException, NamingException {
			
		String sql = "SELECT * FROM board";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
		
		while (rs.next()) {
			boards.add(new BoardDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
		}
		
		return boards;
	}
	
	public static BoardDTO getDetail(String bno) throws SQLException, NamingException {
		
		String sql = "SELECT * FROM board WHERE bno = ?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		return new BoardDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
	}
}