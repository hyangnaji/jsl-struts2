package controller;

import model.Fmsg;
import model.Friend;
import model.Member;

import static controller.JdbcUtils.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FriendDAO {

	public ArrayList<Friend> selectfriend(String f_mid) {
		ArrayList<Friend> f_list = new ArrayList<Friend>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from friend where f_mid=?";
		Friend friend = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_mid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				friend = new Friend(rs.getString("f_name"), rs.getString("f_id"), rs.getString("f_nickname"),
						rs.getString("f_mid"));
				f_list.add(friend);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return f_list;

	}

	public ArrayList<Member> namefind(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where m_name=?";
		ArrayList<Member> list = new ArrayList<Member>();
		Member mem = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mem = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
						rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"),
						rs.getString("m_address"), rs.getInt("m_code"));

				list.add(mem);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return list;
	}

	public Member idfind(String f_mid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where m_id=?";
		Member mem = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_mid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mem = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
						rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"),
						rs.getString("m_address"), rs.getInt("m_code"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return mem;
	}

	public Member countMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member mem = null;
		String sql = "select * from(select * from member order by dbms_random.value) where rownum=1";
		int num = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				mem = new Member(rs.getString("m_id"), rs.getString("m_pass"), rs.getString("m_name"),
						rs.getString("m_email"), rs.getString("m_phone"), rs.getInt("m_open"),
						rs.getString("m_address"), rs.getInt("m_code"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return mem;
	}

	public List<Fmsg> checkFriend(String id) {
		List<Fmsg> f_list = new ArrayList<Fmsg>();
		Fmsg fmsg = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from fmsg where f_toid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				fmsg = new Fmsg(rs.getInt("f_num"), rs.getString("f_msg"), rs.getString("f_toid"),
						rs.getString("f_tonick"), rs.getString("f_fromid"));
				f_list.add(fmsg);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return f_list;
	}

	public Fmsg selectFmsg(String f_fromid, String id) {

		Fmsg fmsg = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from fmsg where f_toid=? and f_fromid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, f_fromid);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				fmsg = new Fmsg(rs.getInt("f_num"), rs.getString("f_msg"), rs.getString("f_toid"),
						rs.getString("f_tonick"), rs.getString("f_fromid"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return fmsg;
	}

	public Friend chkfriend(String m_id, String f_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Friend friend = null;
		String sql = "select * from friend where f_mid=? and f_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, f_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				friend = new Friend(rs.getString("f_name"), rs.getString("f_id"), rs.getString("f_nickname"),
						rs.getString("f_mid"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, rs);
		}

		return friend;
	}

	public int insertFriend(Friend friend) {// 메세지 받아서 친구 추가하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "insert into friend values(friend_seq.nextval, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, friend.getF_name());
			pstmt.setString(2, friend.getF_id());
			pstmt.setString(3, friend.getF_nickname());
			pstmt.setString(4, friend.getF_mid());
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, null);
		}

		return num;
	}

	public int deletefmsg(String f_toid, String fromid) {// 메세지 받고 친구 추가 한뒤에 메세지에서 삭제 거절삭제
		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "delete from fmsg where f_toid=? and f_fromid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_toid);
			pstmt.setString(2, fromid);
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, null);
		}
		return num;
	}

	public int deleteFriend(String f_id, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "delete from friend where f_id=? and f_mid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_id);
			pstmt.setString(2, id);
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, null);
		}
		return num;
	}
	public int modifyFriend(String id, String f_id, String f_nickname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "update  friend  set f_nickname=? where f_id=? and f_mid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f_nickname);
			pstmt.setString(2, f_id);
			pstmt.setString(3, id);
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, null);
		}
		return num;
	}
	public int insertFmsg(Fmsg fmsg) {// 메세지 받아서 친구 추가하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "insert into fmsg values(fmsg_seq.nextval,?,?,?,?)";
		try {
			/*
			 *  F_NUM                                     NOT NULL NUMBER
 F_MSG                                              VARCHAR2(500)
 F_TOID                                    NOT NULL VARCHAR2(20)
 F_TONICK                                           VARCHAR2(20)
 F_FROMID                                  NOT NULL VARCHAR2(20)
 F_FROMNAME
			 * */
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fmsg.getF_msg());
			pstmt.setString(2, fmsg.getF_toid());
			pstmt.setString(3, fmsg.getF_tonick());
			pstmt.setString(4, fmsg.getF_fromid());
			
			num = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			commit(conn);
			close(conn, pstmt, null);
		}

		return num;
	}

}
