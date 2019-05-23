package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import controller.JdbcUtils;
import controller.JdbcUtils.*;
import model.Photo;

public class Snippet {
	   public ArrayList<Photo> getList(int curblock){   
	      String sql = "SELECT * FROM (select rownum as rnum, p_num, p_day, p_subject,p_content,p_addr,p_id from photo "
	            + "order by p_day asc) WHERE rnum>= ? AND rnum <= ?";
	      
	      ArrayList<Photo> list = new ArrayList<Photo>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         conn = JdbcUtils.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1,  (curblock - 1) * 4 + 1);
	          pstmt.setInt(2, curblock *4 );
	         
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
	
	   public int numbermax(){   
	      String sql = "SELECT * FROM photo";
	      int res = 0;
	      
	      ArrayList<Photo> list = new ArrayList<Photo>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         conn = JdbcUtils.getConnection();
	         pstmt = conn.prepareStatement(sql);
	                  
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

