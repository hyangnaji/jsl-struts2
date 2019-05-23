package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import controller.MemberDAO;
import model.Member;

public class Modify_LeaveAction implements Action{
	
	private String userid;
	private String userpass;

	private String error_message;
	
	
	@Override
	public String execute() throws Exception {
		MemberDAO dao = new MemberDAO();
		Member mem = dao.searchMember(userid);
		if(mem == null) {
			return ERROR;
		}
		
		if(userpass.equals("")) {
			return ERROR;
		}
		
		if(!userpass.equals(mem.getUserpass())) {
			error_message = "비밀번호가 일치하지 않습니다.";
			return ERROR;
		}
		
		if(userpass.equals(mem.getUserpass())) {
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



	public String getUserpass() {
		return userpass;
	}



	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}



	public String getError_message() {
		return error_message;
	}

	public void setError_message(String error_message) {
		this.error_message = error_message;
	}
	
	
	
}
