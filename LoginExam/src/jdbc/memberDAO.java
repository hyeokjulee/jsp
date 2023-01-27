package jdbc;

import java.sql.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class memberDAO {

	public static int insert(String mname, String mid, String mpass, String mgender, String memail) throws NamingException, SQLException {
		
		String sql = "INSERT INTO member (mname, mid, mpass, mgender, memail) VALUES(?, ?, ?, ?, ?)";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mname);
		pstmt.setString(2, mid);
		pstmt.setString(3, mpass);
		pstmt.setString(4, mgender);
		pstmt.setString(5, memail);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	public static int login(String mid, String mpass) throws NamingException, SQLException {
		
		String sql = "SELECT mpass FROM member WHERE mid = ?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(!rs.next()) {
			return 1; //디비에 회원 정보가 전혀 없는 경우
		} else if (!mpass.equals(rs.getString(1))) {
			return 2; //비번만 틀린 경우
		} else {
			return 0; //아이디와 비번이 모두 일치하는 경우
		}
	}
	
	public static int exist(String memail) throws NamingException, SQLException {
		
		String sql = "SELECT mid FROM member WHERE memail = ?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, memail);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			return 1; //디비에 회원 정보가 있는 경우
		} else {
			return 0; //디비에 회원 정보가 없는 경우
		}
	}
}