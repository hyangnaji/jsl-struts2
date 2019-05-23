package controller;

import static controller.JdbcUtils.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Photo;

public class PhotoDAO {

	public List<Photo> phtoList(String userid) {
		String sql = "select * from photo where p_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Photo> p_list = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			p_list = new ArrayList<Photo>();
			
			while(rs.next()) {
				p_list.add(new Photo(rs.getInt("p_num"), rs.getString("p_day"), rs.getString("p_subject"),
					rs.getString("p_content"), rs.getString("p_addr"), rs.getString("p_id")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}

		return p_list;
	}

	public int insertPhoto(Photo photo) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into photo values(null,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, photo.getP_day());
			pstmt.setString(2, photo.getP_subject());
			pstmt.setString(3, photo.getP_content());
			pstmt.setString(4, photo.getP_addr());
			pstmt.setString(5, photo.getP_id());
			num = pstmt.executeUpdate();
			if (num == 1) {
				commit(conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}

		return num;
	}

	public int deletePhoto(String p_id, String p_addr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from photo where p_id=? and p_addr=?";
		int num = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.setString(2, p_addr);
			num = pstmt.executeUpdate();
			if(num==1) {
				commit(conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return num;
	}

	public int modifyPhoto(Photo photo1) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update photo set p_day=?, p_subject=?, p_content=?, p_addr=? where p_num=?";
		int num = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, photo1.getP_day());
			pstmt.setString(2, photo1.getP_subject());
			pstmt.setString(3, photo1.getP_content());
			pstmt.setString(4, photo1.getP_addr());
			pstmt.setInt(5, photo1.getP_num());
			num = pstmt.executeUpdate();
			if(num==1) {
				commit(conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return num;

	}

	public Photo selectPhoto(int oldp_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from photo where p_num=?";
		ResultSet rs = null;
		Photo p1 = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, oldp_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				p1 = new Photo(rs.getInt("p_num"), rs.getString("p_day"), rs.getString("p_subject"),
						rs.getString("p_content"), rs.getString("p_addr"), rs.getString("p_id"));
			}
			
			commit(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return p1;
	}
	
	   public ArrayList<Photo> getList(int curblock,String id){   
		      String sql = "SELECT * FROM (select rownum as rnum, p_num, p_day, p_subject,p_content,p_addr,p_id from photo where p_id=?"
		            + "order by p_day asc) WHERE rnum>= ? AND rnum <= ?";
		      
		      ArrayList<Photo> list = new ArrayList<Photo>();
		      
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      try {
		         conn = JdbcUtils.getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1,id);

		         pstmt.setInt(2,  (curblock - 1) * 4 + 1);
		          pstmt.setInt(3, curblock *4 );
		         
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()) {
		            
		            list.add(new Photo(rs.getInt("p_num"), rs.getString("p_day"), rs.getString("p_subject"),
		                  rs.getString("p_content"), rs.getString("p_addr"), rs.getString("p_id")));
		         }
		         
		      }catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         JdbcUtils.close(conn, pstmt, rs);
		      }
		      return list;
		   }

		   public int numbermax(String id){   
		      String sql = "SELECT * FROM photo where p_id=?";
		      int res = 0;
		      
		      ArrayList<Photo> list = new ArrayList<Photo>();
		      
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      try {
		         conn = JdbcUtils.getConnection();
		         pstmt = conn.prepareStatement(sql);
		               pstmt.setString(1, id);   
		         rs = pstmt.executeQuery();
		         
		         while(rs.next()) {
		         
		            list.add(new Photo(rs.getInt("p_num"), rs.getString("p_day"), rs.getString("p_subject"),
		                  rs.getString("p_content"), rs.getString("p_addr"), rs.getString("p_id")));
		         }
		         
		         res = (int)(list.size()/4)+1;
		         
		      }catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         JdbcUtils.close(conn, pstmt, rs);
		      }
		      return res;
		   }
}
