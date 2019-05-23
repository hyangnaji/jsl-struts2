package action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;

import controller.MemberDAO;
import model.Member;

public class UserSearchAction implements Action{
	private String userid;
	private String username;
	private String i_name;
	private String i_intro;
	private String u_name;		//검색한 이름
	
	private List<Member> list;
	
	@Override
	public String execute() throws Exception {
		MemberDAO dao = new MemberDAO();
		list = new ArrayList<Member>();
		
		list = dao.searchname(u_name);
		
		if(list != null) {
			return SUCCESS;
		}
		
		return ERROR;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getI_intro() {
		return i_intro;
	}

	public void setI_intro(String i_intro) {
		this.i_intro = i_intro;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public List<Member> getList() {
		return list;
	}

	public void setList(List<Member> list) {
		this.list = list;
	}
	
	
	
	

}
