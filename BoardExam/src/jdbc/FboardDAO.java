package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;

public class FboardDAO {

	public static int insert(String btitle, String bwriter, String bcontent, String bfile1, String bfile2) throws NamingException, SQLException {
		
		String sql = "INSERT INTO fboard (btitle, bwriter, bcontent, bfile1, bfile2) VALUES(?, ?, ?, ?, ?)";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, btitle);
		pstmt.setString(2, bwriter);
		pstmt.setString(3, bcontent);
		pstmt.setString(4, bfile1);
		pstmt.setString(5, bfile2);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	
	public static ArrayList<FboardDTO> getList() throws SQLException, NamingException {
			
		String sql = "SELECT * FROM fboard";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<FboardDTO> boards = new ArrayList<FboardDTO>();
		
		while (rs.next()) {
			boards.add(new FboardDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
		}
		
		return boards;
	}
	
	public static FboardDTO getDetail(String bno) throws SQLException, NamingException {
		
		String sql = "SELECT * FROM fboard WHERE bno = ?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		return new FboardDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
	}
}