package jdbc;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class StudentDAO {

	//테이블에 데이터를 입력하는 메서드
	public static int insert(String hakbun, String name, String dept, String addr) throws SQLException, NamingException {
		
		//C R U D
		
		String sql = "INSERT INTO student VALUES(?, ?, ?, ?)";
		
		Connection conn = ConnectionPool.get(); //커넥션 풀 사용
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hakbun);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, addr);
		
		int result = pstmt.executeUpdate();
		// SQL 구문 실행 성공 여부가 1과 0으로 돌아온다.
		
//		pstmt.close();
//		conn.close();
		
		return result;
	}
	
	public static ArrayList<StudentDTO> getList() throws SQLException, NamingException {
		
		String sql = "SELECT * FROM student";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<StudentDTO> students = new ArrayList<StudentDTO>();
		
		while (rs.next()) {
			students.add(new StudentDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
		}
		
		return students;
	}
	
	public static StudentDTO getDetail(String hakbun) throws SQLException, NamingException {
		
		String sql = "SELECT * FROM student WHERE hakbun = ?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, hakbun);
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		return new StudentDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
	}
}