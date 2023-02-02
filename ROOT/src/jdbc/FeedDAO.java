package jdbc;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import org.json.simple.*;
import util.ConnectionPool;

public class FeedDAO {
	public static boolean insert(String id, String content) {
		try {
			String sql = "INSERT INTO feed (id, content) VALUES(?, ?)";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			
			if(pstmt.executeUpdate() == 1) {
				pstmt.close();
				conn.close();
				return true;
			} else {
				pstmt.close();
				conn.close();
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String getListAJAX() { //AJAX로 모든 리스트 출력 메서드
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray feeds = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("no", rs.getString(1));
				obj.put("id", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("ts", rs.getString(4));
				
				feeds.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return feeds.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<FeedDTO> getAllList() { //관리자용 모든 메모 보기
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();
			
			while (rs.next()) {
				feeds.add(new FeedDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return feeds;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<FeedDTO> getList(String id) { //회원 자신의 메모만 보기
		try {
			String sql = "SELECT * FROM feed WHERE id = ? ORDER BY ts DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();
			
			while (rs.next()) {
				feeds.add(new FeedDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return feeds;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int delete(String no) {
		int result = 0;
		try {
			String sql = "DELETE FROM feed WHERE no = ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
