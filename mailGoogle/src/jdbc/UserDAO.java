package jdbc;

import java.sql.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class UserDAO {
	
	// Connection Pool 셋팅
		// 1.context.xml
		// 2.ConnectionPool.java
		// 3.connector lib

	public static int join(String to, String pass, String name, String content) throws NamingException, SQLException{
		String sql = "INSERT INTO user VALUES(?, ?, ?, ?)";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, to);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, content);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
}