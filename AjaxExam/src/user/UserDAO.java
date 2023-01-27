package user;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class UserDAO {

	public static int insert(String userName, int userAge, String userGender, String userEmail, String userPhone) {
		String sql = "INSERT INTO user VALUES(?, ?, ?, ?, ?)";
		int result = 0;
		try {
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setInt(2, userAge);
			pstmt.setString(3, userGender);
			pstmt.setString(4, userEmail);
			pstmt.setString(5, userPhone);
			result = pstmt.executeUpdate();
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public static ArrayList<User> getList() throws SQLException, NamingException {
		
		String sql = "SELECT * FROM user";
		
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<User> users = new ArrayList<User>();
		while (rs.next()) {
			users.add(new User(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)));
		}
		
		return users;
	}
	
	public static ArrayList<User> search(String userName) {
		ArrayList<User> users = new ArrayList<User>();
		
		try {
			String sql = "SELECT * FROM user WHERE userName LIKE ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + userName + "%");
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				users.add(new User(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			}
			
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	public static String getListJSON() throws SQLException, NamingException {
		String sql = "SELECT * FROM user";
		
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
//		기존의 유저 데이터를 객체로 추출하여 배열로 만든 방법
/*		
		ArrayList<User> users = new ArrayList<User>();
		while (rs.next()) {
			users.add(new User(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
		}
*/		
		JSONArray users = new JSONArray();
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("userName", rs.getString("userName"));
			obj.put("userAge", rs.getInt("userAge"));
			obj.put("userGender", rs.getString("userGender"));
			obj.put("userEmail", rs.getString("userEmail"));
			users.add(obj);
		}
		
		return users.toJSONString();
	}
}