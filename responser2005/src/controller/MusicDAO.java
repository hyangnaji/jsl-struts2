package controller;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Music;

public class MusicDAO {
	public int insertMusic(String musicname, String musicartist) {
		int res = 0;
		String sql = "insert into music values(music_seq.nextval, ?, ?, null)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, musicname);
			pstmt.setString(2, musicartist);
			
			res = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, null);
		}		
		
		return res;
	}
	
	public int updateMusicaddress(int musiccode, File musicaddress) {
		int res = 0;
		String sql = "update music set musicaddress = ? where musiccode = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, musicaddress.getAbsolutePath());
			pstmt.setInt(2, musiccode);
			
			res = pstmt.executeUpdate();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, null);
		}				
		
		return res;
		
	}
	
	public Music searchMusicname(String musicname, String musicartist) {
		Music music = null;
		
		String sql = "select * from music where musicname = ? and musicartist = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, musicname);
			pstmt.setString(2, musicartist);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, null);
		}		
		
		return music;
		
	}
	
	public Music searchMusiccode(String musicname, String musicartist) {
		Music music = null;
		
		String sql = "select * from music where musicname = ? and musicartist = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, musicname);
			pstmt.setString(2, musicartist);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"), rs.getString("musicaddress"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, null);
		}		
		
		return music;
		
	}

	public int searchMusic(String musicaddress) {
		int code = 0;
		
		String sql = "select * from music where musicaddress = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, musicaddress);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				code = rs.getInt("musiccode");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, null);
		}		
		
		
		
		return code;
	}
	
	public Music selectcode(int musiccode) {
		Music music = null;
		
		String sql = "select * from music where musiccode = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, musiccode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"), rs.getString("musicaddress"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, null);
		}		
		
		return music;
	}
	
	
	public ArrayList<Music> getList(int pageNumber){	
		String sql = "SELECT * FROM (select rownum as rnum, musiccode, musicname, musicartist, musicaddress from music where musicartist is not null order by musicname asc) WHERE rnum>= ? AND rnum <= ?";
		
		ArrayList<Music> list = new ArrayList<Music>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  (pageNumber - 1) * 10 + 1);
		    pstmt.setInt(2, pageNumber *10 );
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Music music = null;
				list.add(music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"), rs.getString("musicaddress")));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, rs);
		}
		return list;
	}
	

	public int numbermax(int pageNumber){	
		String sql = "SELECT * FROM music where musicartist is not null";
		int res = 0;
		
		ArrayList<Music> list = new ArrayList<Music>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Music music = null;
				list.add(music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"), rs.getString("musicaddress")));
			}
			
			res = (int)(list.size()/10)+1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, rs);
		}
		return res;
	}
	
	public List<Music> searchMusicname(String name){
		String sql = "select * from music where musicname like '%' || ? || '%' ";
		
		List<Music> list = new ArrayList<Music>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Music music = null;
				list.add(music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"), rs.getString("musicaddress")));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, rs);
		}
		
		return list;
		
	}

	public List<Music> searchMusicartist(String musicartist) {
		String sql = "select * from music where musicartist like '%' || ? || '%' ";
		
		List<Music> list = new ArrayList<Music>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, musicartist);
						
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Music music = null;
				list.add(music = new Music(rs.getInt("musiccode"), rs.getString("musicname"), rs.getString("musicartist"), rs.getString("musicaddress")));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
}
