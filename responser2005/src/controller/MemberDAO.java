package controller;

import static controller.JdbcUtils.close;
import static controller.JdbcUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Member;
import model.Music;

public class MemberDAO {	
	public int insertMember(Member mem) {
		int res = 0;
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getUserid());
			pstmt.setString(2, mem.getUserpass());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getEmail());
			pstmt.setString(5, mem.getPhone());
			pstmt.setInt(6, mem.getOpen());
			pstmt.setString(7, mem.getAddress());
			pstmt.setInt(8, 1);
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return res;
	}
	
	public Member searchMember(String userid) {
		Member mem = null;
		
		String sql = "select * from member where m_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mem = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
						rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"), rs.getString("m_address"), rs.getInt("m_code"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		
		return mem;
	}
	
	public String searchID(String username, String useremail, String phone) {
		String res = null;
		
		String sql = "select * from member where m_name = ? and m_email = ? and m_phone = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, useremail);
			pstmt.setString(3, phone);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				res = rs.getString("m_id");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}		
		
		return res;
		
	}
	
	public int updatePW(String userid, String userpass) {
		int res = 0;
		
		String sql = "update member set m_pass = ? where m_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userpass);
			pstmt.setString(2, userid);
			
			res = pstmt.executeUpdate();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}	
		
		return res;
	}
	
	public int modifymem(String userpass, String email, String phone, String userid) {
		int res = 0;
		
		String sql = "update member set m_pass = ?, m_email =?, m_phone = ? where m_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userpass);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setString(4, userid);
			
			res = pstmt.executeUpdate();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}	
		
		return res;
	}
	
	public int deleteMember(String userid) {
		int res = 0;
		String sql = "delete from member where m_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);			
			
			res = pstmt.executeUpdate();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return res;
	}
	
	
	public int updatemusiccode(int musiccode, String userid) {
		int res = 0;
		
		String sql = "update member set m_code = ? where m_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, musiccode);
			pstmt.setString(2, userid);			
			
			res = pstmt.executeUpdate();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return res;
	}
	
	public Music selectmusic(String userid, int musiccode) {
		Music music = null;
		MusicDAO dao = new MusicDAO();
		
		String sql = "select m_code from member where m_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
				
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				music = dao.selectcode(rs.getInt("m_code"));				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return music;		
	}
	
	public List<Member> memberlist(){
		Member mem = null;
		List<Member> list = null;
		String sql = "select * from member";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		list = new ArrayList<Member>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mem = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
						rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"), rs.getString("m_address"), rs.getInt("m_code"));
				list.add(mem);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return list;		
		
	}
	
	public List<Member> searchname(String username){
		Member mem = null;
		List<Member> list = null;
		String sql = "select * from member where m_name = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		list = new ArrayList<Member>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mem = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
						rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"), rs.getString("m_address"), rs.getInt("m_code"));
				list.add(mem);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return list;		
		
	}
	
	public int deleteMusic(String userid) {
		int res = 0;
		
		String sql = "update member set m_code = 1 where m_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			res = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return res;
	}
	
	public ArrayList<Member> getList(int curblock){   
	      
	      /*
	       * private String i_id;         //홈피 아이디
	   private String i_address;      //홈피 주소
	   private String i_name;         //홈피 타이틀
	   private String i_pic;         //개인프로필 사진
	   private String i_intro;         //개인 소개
	   private int i_open;            //정보공개||비공개
	       * */
	      String sql = "SELECT * FROM (select rownum as rnum, m_id,m_pass, m_name,m_email,m_phone,m_open, m_address, m_code from member order by m_name asc) WHERE rnum>= ? AND rnum <= ?";
	      
	      ArrayList<Member> list = new ArrayList<Member>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         conn = JdbcUtils.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1,  (curblock - 1) * 8 + 1);
	          pstmt.setInt(2, curblock *8 );
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            list.add( new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
	                  rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"), rs.getString("m_address"), rs.getInt("m_code")));
	         }
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         JdbcUtils.close(conn, pstmt, rs);
	      }
	      return list;
	   }

	   public int numbermax(){   
	      String sql = "SELECT * FROM member";
	      int res = 0;
	      
	      ArrayList<Member> list = new ArrayList<Member>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         conn = JdbcUtils.getConnection();
	         pstmt = conn.prepareStatement(sql);
	                  
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	         
	            list.add( new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
	                  rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"), rs.getString("m_address"), rs.getInt("m_code")));
	         }
	         
	         res = (int)(list.size()/10)+1;
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         JdbcUtils.close(conn, pstmt, rs);
	      }
	      return res;
	   }
	
}
