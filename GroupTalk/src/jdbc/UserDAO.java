package jdbc;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import org.json.simple.*;
import util.ConnectionPool;

public class UserDAO {
	public static int insert(String id, String password, String name) { // 회원 가입
		try {
			String sql = "INSERT INTO user (id, password, name) VALUES(?, ?, ?)";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			
			return pstmt.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return 0;
		}
	}
	
	public static int edit(String id, String password, String name) { // 회원 가입
		try {
			String sql = "UPDATE user SET password = ?, name = ? WHERE id = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, id);
			
			return pstmt.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return 0;
		}
	}

	public static boolean exist(String id) { // 회원 가입시 아이디가 이미 존재하는지 여부 확인
		try {
			String sql = "SELECT * FROM user WHERE id = ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();

			return rs.next();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static int delete(String id) { // 회원 탈퇴
		try {
			String sql = "DELETE FROM user WHERE id = ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			return pstmt.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int login(String id, String password) throws SQLException, NamingException { // 회원 로그인
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return 1; // 아이디가 존재하지 않는 경우
			} else if(!password.equals(rs.getString(2))) {
				return 2; // 아이디는 존재하지만 비번이 일치하지 않는 경우
			} else {
				return 0; // 로그인 성공
			}
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
	}
	
	public static ArrayList<UserDTO> list() {
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<UserDTO> users = new ArrayList<UserDTO>();
			
			while (rs.next()) {
				users.add(new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return users;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String listAJAX() { //AJAX로 모든 리스트 출력 메서드
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray users = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				obj.put("password", rs.getString(2));
				obj.put("name", rs.getString(3));
				obj.put("ts", rs.getString(4));
				
				users.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return users.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
