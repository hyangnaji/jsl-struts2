package controller;

import static controller.JdbcUtils.close;
import static controller.JdbcUtils.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Info;
import model.Member;

public class InfoDAO { 
	
	public int insertInfo(Info info) {
		int res = 0;
		
		String sql = "insert into info values(?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, info.getI_id());
			pstmt.setString(2, info.getI_address());
			pstmt.setString(3, info.getI_name());
			pstmt.setString(4, "C:\\Users\\siwon\\Desktop\\source\\responser2005\\WebContent\\memberimg\\default.jpg");
			pstmt.setString(5, "안녕하세요.");
			pstmt.setInt(6, 0);
			
			res = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}		
		
		return res;
	}
	
	
	public Info searchInfo(Member mem) {
		Info info = null;
		
		String sql = "select * from info where i_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getUserid());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				info = new Info(rs.getString("i_id"), rs.getString("i_address"), rs.getString("i_name"), rs.getString("i_pic"),
						rs.getString("i_intro"), rs.getInt("i_open"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}		
		
		return info;		
	}

	public Info selectInfo(String i_id) {
		Info info = null;
		
		String sql = "select * from info where i_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, i_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				info = new Info(rs.getString("i_id"), rs.getString("i_address"), rs.getString("i_name"), rs.getString("i_pic"),
						rs.getString("i_intro"), rs.getInt("i_open"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}		
		
		return info;	
	}


	public int modify_home(Info new_info) {
		int res = 0;
		
		String sql = "update info set i_name = ?, i_pic = ?, i_intro = ?, i_open = ? where i_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, new_info.getI_name());
			pstmt.setString(2, new_info.getI_pic());
			pstmt.setString(3, new_info.getI_intro());
			pstmt.setInt(4, new_info.getI_open());
			pstmt.setString(5, new_info.getI_id());
			
			res = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}		
		
		return res;
	}
	
	public int modify_Noimage(Info new_info) {
		int res = 0;
		
		String sql = "update info set i_name = ?, i_intro = ?, i_open = ? where i_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, new_info.getI_name());
			pstmt.setString(2, new_info.getI_intro());
			pstmt.setInt(3, new_info.getI_open());
			pstmt.setString(4, new_info.getI_id());
			
			res = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}		
		
		return res;
	}
	
	public int updatePhoto(String photoaddress, String userid) {
		int res = 0;
		
		String sql = "update info set i_pic = ? where i_id =?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, photoaddress);
			pstmt.setString(2, userid);			
			
			res = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}	
		
		return res;
		
	}
	
}

