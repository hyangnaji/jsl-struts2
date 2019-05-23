package controller;

import static controller.JdbcUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.opensymphony.xwork2.ActionContext;

public class VisitCountDAO {	
	
/*	    private static VisitCountDAO instance;
	    
	    // 싱글톤 패턴
	    private VisitCountDAO(){}
	    public static VisitCountDAO getInstance(){
	        if(instance==null)
	            instance=new VisitCountDAO();
	        return instance;
	    }
	    */
	    /**
	     * 총방문자수를 증가시킨다.
	     */
	    public void setTotalCount(String id, String address) throws SQLException
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            
	            // 쿼리생성
	            // 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
	            StringBuffer sql = new StringBuffer();
	            sql.append("INSERT INTO VISIT (V_DATE, v_id, v_address) VALUES (sysdate, ?, ?)");
	            
	            // 커넥션을 가져온다.
	            conn = getConnection();
	                        
	            // 자동 커밋을 false로 한다.
	            conn.setAutoCommit(false);
	            
	            pstmt = conn.prepareStatement(sql.toString());
	            pstmt.setString(1, id);
	            pstmt.setString(2, address);
	            // 쿼리 실행
	            pstmt.executeUpdate();
	            // 완료시 커밋
	            conn.commit(); 
	            
	        } catch (Exception sqle) {
	            // 오류시 롤백
	            conn.rollback(); 
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            // Connection, PreparedStatement를 닫는다.
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } // end setTotalCount()
	    
	    /**
	     * 총 방문자수를 가져온다.
	     * @return totalCount : 총 방문자 수
	     */
	    public int getTotalCount(String id, String address)
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        int totalCount = 0;
	        
	        try {
	            
	            // 테이블의 테이터 수를 가져온다.
	            // 데이터 수 = 총 방문자 수
	            StringBuffer sql = new StringBuffer();
	            sql.append("SELECT COUNT(*) AS TotalCnt FROM VISIT where v_id != ? and v_address = ?");
	            
	            conn = getConnection();
	            pstmt = conn.prepareStatement(sql.toString());
	            pstmt.setString(1, id);
	            pstmt.setString(2, address);
	            rs = pstmt.executeQuery();
	            
	            // 방문자 수를 변수에 담는다.
	            if (rs.next()) 
	                totalCount = rs.getInt("TotalCnt");
	            
	            return totalCount;
	            
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            // Connection, PreparedStatement를 닫는다.
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } // end getTotalCount()
	    
	    /**
	     * 오늘 방문자 수를 가져온다.
	     * @return todayCount : 오늘 방문자
	     */
	    public int getTodayCount(String id, String address)
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        int todayCount = 0;
	        
	        try {
	            
	            StringBuffer sql = new StringBuffer();
	            sql.append("SELECT COUNT(*) AS TodayCnt FROM VISIT");
	            sql.append(" WHERE TO_DATE(V_DATE, 'YYYY-MM-DD') = TO_DATE(sysdate, 'YYYY-MM-DD') and v_id != ? and v_address = ?");
	            
	            conn = getConnection();
	            pstmt = conn.prepareStatement(sql.toString());
	            pstmt.setString(1, id);
	            pstmt.setString(2, address);
	            rs = pstmt.executeQuery();
	            
	            // 방문자 수를 변수에 담는다.
	            if (rs.next()) 
	                todayCount = rs.getInt("TodayCnt");
	            
	            return todayCount;
	            
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            // Connection, PreparedStatement를 닫는다.
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    }// end getTodayCount()
	
	
}
