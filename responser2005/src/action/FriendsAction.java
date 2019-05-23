package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import controller.FriendDAO;
import model.Fmsg;
import model.Friend;
import model.Member;

public class FriendsAction extends ActionSupport {
	private String f_name;
	private String f_id;
	private String f_nickname;
	private String f_mid;
	private Friend friend;
	private String msg;
	private Member mem;
	private ArrayList<Friend> fr_list;
	private ArrayList<Member> m_list;
	private static String path = "http://localhost:8080/responser2005/world/";
	private String userid;
	private String userpass;
	private String username;
	private String email;
	private String phone;
	private int open;
	private String address;
	private int m_code;
	private int f_num;
	private String f_msg;
	private String f_toid;
	private String f_fromid;
	private String f_tonick;
	private List<Fmsg> f_list;
	private Fmsg fmsg;
	private Map<String, Object> session;
	private String f_address;
	private String f_fromname;


	public String surfRiding() throws Exception {// 파도타기
	      FriendDAO dao = new FriendDAO();
	      Member mem = new Member();
	      mem = dao.countMember();
	      if (mem != null) {
	         do{
	            mem = dao.countMember();
	         }while(mem.getUserid().equals((String)ActionContext.getContext().getSession().get("userid")));      
	         
	         this.f_id = mem.getUserid();
	         return SUCCESS;
	      }
	      return ERROR;
	   }

	public String namefind() throws Exception {// 이름으로 친구 찾기

		FriendDAO dao = new FriendDAO();

		ArrayList<Member> m_list = dao.namefind(username);

		if (m_list != null) {
			this.m_list = m_list;
			return SUCCESS;
		}

		return ERROR;
	}

	public String idfind() throws Exception {// 아이디로 친구 찾기
		FriendDAO dao = new FriendDAO();

		Member mem = dao.idfind(userid);
		if (mem != null) {
			this.mem = mem;
			return SUCCESS;
		}

		return ERROR;
	}

	public String msgFriend() throws Exception {// 친구추가 메세지 불러오기
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		FriendDAO dao = new FriendDAO();
		List<Fmsg> f_list = dao.checkFriend(id);
		if (f_list != null) {
			this.f_list = f_list;
			return SUCCESS;
		}
		return ERROR;

	}

	public String addfmsg() throws Exception {// 메세지에서 친구 추가하기

		if (!f_fromid.equals("")) {
			FriendDAO dao = new FriendDAO();
			Member mem = null;
			mem = dao.idfind(f_fromid);

			if (mem != null) {
				this.mem = mem;
				return SUCCESS;
			}

			return ERROR;
		}
		return ERROR;
	}

	public String insertfriend() throws Exception {// 친구테이블에 친구 추가
		FriendDAO dao = new FriendDAO();
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		String name=(String)session.get("username"); 
		Friend friend = new Friend(f_name, f_id, f_nickname, id);

		Fmsg fmsg = dao.selectFmsg(id, f_id);
		

		Friend friend2 = new Friend(name, id, fmsg.getF_tonick(), fmsg.getF_fromid());
		// String f_name, String f_id, String f_nickname, String f_mid

		int num = dao.insertFriend(friend);
		num = dao.insertFriend(friend2);
		if (num == 1) {
			
			int num2 = dao.deletefmsg(id, f_id);
			if (num2 == 1) {
				dao.deletefmsg(f_id, id);
				return SUCCESS;
			}
			return ERROR;
		}
		return ERROR;
	}
		

	public String checkfmsg() throws Exception {// 친구인지 확인하고 가자고
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		FriendDAO dao = new FriendDAO();
		Friend friend = null;
		friend = dao.chkfriend(f_toid, id);
		if (friend != null) {
			msg = "이미 우린 친구";
			return ERROR;
		}
		this.f_toid = f_toid;
		this.f_fromid = id;

		return SUCCESS;
	}

	public String sendfmsg() throws Exception {
		String id = (String) ActionContext.getContext().getSession().get("userid");
		String name=(String)ActionContext.getContext().getSession().get("username"); 
		FriendDAO dao = new FriendDAO();
		List<Fmsg> f_list = dao.checkFriend(id);
		int num=0;
		Fmsg old_fmsg = dao.selectFmsg(f_toid,id);		//보낸게 있나 확인
		Fmsg fmsg = new Fmsg(0,f_msg,f_toid,f_tonick,f_fromid);
		if (f_list != null) {
			for (Fmsg fms : f_list) {
				if (fms.getF_fromid().equals(id) && fms.getF_toid().equals(f_toid)) {
					msg="이미 우린 친구사이";
					return ERROR;
				}				
			}
		}
		if(old_fmsg == null) {			
			num=dao.insertFmsg(fmsg);
			if(num==1) return SUCCESS;
		}
		
		msg="이미 보냄";
		return ERROR;
	}

	public String removemsg() throws Exception {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		FriendDAO dao = new FriendDAO();
		int num = dao.deletefmsg(id, f_fromid);
		if (num == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String deleteFriend() {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		FriendDAO dao = new FriendDAO();
		int num = dao.deleteFriend(f_id, id);
		if (num == 1) {
			 dao.deleteFriend( id,f_id);
			return SUCCESS;
		}
		return ERROR;
	}

	public String friendlist() throws Exception {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		FriendDAO dao = new FriendDAO();
		ArrayList<Friend> fr_list = dao.selectfriend(id);
		if (fr_list != null) {
			this.fr_list = fr_list;
			return SUCCESS;
		}
		return ERROR;
	}

	public String modifyFriend() {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String) session.get("userid");
		FriendDAO dao = new FriendDAO();
		int num = dao.modifyFriend(id, f_id, f_nickname);
		if(num==1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public List<Fmsg> getF_list() {
		return f_list;
	}

	public void setF_list(List<Fmsg> f_list) {
		this.f_list = f_list;
	}

	public Fmsg getFmsg() {
		return fmsg;
	}

	public void setFmsg(Fmsg fmsg) {
		this.fmsg = fmsg;
	}

	public String getUserid() {
		return userid;
	}

	public ArrayList<Friend> getFr_list() {
		return fr_list;
	}

	public void setFr_list(ArrayList<Friend> fr_list) {
		this.fr_list = fr_list;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public String getUsername() {
		return username;
	}

	public void setName(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public String getAddress() {
		return address;
	}

	public String getF_tonick() {
		return f_tonick;
	}

	public void setF_tonick(String f_tonick) {
		this.f_tonick = f_tonick;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	public ArrayList<Member> getM_list() {
		return m_list;
	}

	public void setM_list(ArrayList<Member> m_list) {
		this.m_list = m_list;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Friend getFriend() {
		return friend;
	}

	public void setFriend(Friend friend) {
		this.friend = friend;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_id() {
		return f_id;
	}

	public void setF_id(String f_id) {
		this.f_id = f_id;
	}

	public String getF_nickname() {
		return f_nickname;
	}

	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}

	public String getF_mid() {
		return f_mid;
	}

	public void setF_mid(String f_mid) {
		this.f_mid = f_mid;
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getF_msg() {
		return f_msg;
	}

	public void setF_msg(String f_msg) {
		this.f_msg = f_msg;
	}

	public String getF_toid() {
		return f_toid;
	}

	public void setF_toid(String f_toid) {
		this.f_toid = f_toid;
	}

	public String getF_fromid() {
		return f_fromid;
	}

	public void setF_fromid(String f_fromid) {
		this.f_fromid = f_fromid;
	}

	public String getF_address() {
		return f_address;
	}

	public void setF_address(String f_address) {
		this.f_address = f_address;
	}

	public String getF_fromname() {
		return f_fromname;
	}

	public void setF_fromname(String f_fromname) {
		this.f_fromname = f_fromname;
	}

}
