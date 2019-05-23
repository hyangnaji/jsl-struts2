package controller;

import static controller.JdbcUtils.close;
import static controller.JdbcUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Diary;

public class DiaryDAO {
	public List<Diary> totalDiary(String userid) {
		Diary d = null;
		List<Diary> list = null;
		String sql = "select * from diary where d_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();
			
				list = new ArrayList<Diary>();
			while (rs.next()) {
				d = new Diary();
				d.setNum(rs.getInt("d_num"));
				d.setString(rs.getString("d_day"));
				d.setSubject(rs.getString("d_subject"));
				d.setContent(rs.getString("d_content"));
				d.setId(userid);
				list.add(d);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}

	public int insertDiary(String date, String subject, String content, String id) {

		String sql = "insert into diary values(null,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(2, subject);
			pstmt.setString(1, date);
			pstmt.setString(3, content);
			pstmt.setString(4, id);
			
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return num;
	}

	public Diary dateDiary(String id, String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Diary d = null;
		String sql = "select * from diary where d_id = ? and d_day=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, Integer.parseInt(date));
			rs = pstmt.executeQuery();

			if (rs.next()) {
				d = new Diary();
				d.setNum(rs.getInt("d_num"));
				d.setString(date);
				d.setSubject(rs.getString("d_subject"));
				d.setContent(rs.getString("d_content"));
				d.setId(id);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}

		return d;
	}

	public int modifyDiary(Diary diary) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		Diary d = null;
		int num = 0;
		String sql = "update diary set d_subject=?,d_content=? where d_id = ? and d_day=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, diary.getSubject());
			pstmt.setString(2, diary.getContent());
			pstmt.setString(3, diary.getId());
			pstmt.setString(4, diary.getString());
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}

		return num;
	}
	
	public int deleteDiary(String id, String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		Diary d = null;
		int num=0;
		String sql = "delete from diary where d_id = ? and d_day=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, Integer.parseInt(date));
		

		num=pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}

		return num;
	}
}
