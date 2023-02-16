package jdbc;

import java.sql.*;
import javax.naming.NamingException;
import org.json.simple.*;
import util.ConnectionPool;

public class FeedDAO {
	public static int insert(String id, String content) {
		try {
			String sql = "INSERT INTO feed (id, content) VALUES(?, ?)";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();	
			conn.close();
			
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return 0;
		}
	}
	
	public static String getList() { //AJAX로 모든 리스트 출력 메서드
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray feeds = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				String ts = rs.getString(4).split(" ")[0].substring(2);
				
				obj.put("no", rs.getString(1));
				obj.put("id", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("ts", ts);
				
				feeds.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return feeds.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	public static String getMyList(String sid) { //AJAX로 내 피드 리스트 출력 메서드
		try {
			String sql = "SELECT * FROM feed WHERE id = ? ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray feeds = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				String ts = rs.getString(4).split(" ")[0].substring(2);
				
				obj.put("no", rs.getString(1));
				obj.put("id", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("ts", ts);
				
				feeds.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return feeds.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return null;
		}
	}

	public static int delete(String no) {
		try {
			String sql = "DELETE FROM feed WHERE no = ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return 0;
		}
	}
}
