package action;

import com.opensymphony.xwork2.Action;

import controller.MemberDAO;
import model.Member;

public class FindPWAction implements Action{
	private String userid;
	private String username;
	private String useremail;
	private String phone;
	private String userpass;
	private String re_pass;
	
	private String error_message;

	@Override
	public String execute() throws Exception {
		
		MemberDAO dao = new MemberDAO();
		
		String id = null;
		id = dao.searchID(username, useremail, phone);
		
		if(id != null) {
			Member mem = null;
			mem = dao.searchMember(id);
			
			if(mem != null) {
				userid = mem.getUserid();
				return INPUT;
			}
			
		}
		
		Member mem = null;
		mem = dao.searchMember(userid);
		
		if(mem != null) {
			if(!mem.getName().equals(username)) {
				error_message = "이름을 확인해주세요.";
				return ERROR;
			}
			if(!mem.getEmail().equals(useremail)) {
				error_message = "이메일을 확인해주세요.";
				return ERROR;
			}
			if(!mem.getPhone().equals(phone)) {
				error_message = "전화번호를 확인해주세요.";
				return ERROR;
			}
			
		}
		
		error_message = "일치하는 아이디를 찾지 못했습니다.";
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

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public String getRe_pass() {
		return re_pass;
	}

	public void setRe_pass(String re_pass) {
		this.re_pass = re_pass;
	}

	public String getError_message() {
		return error_message;
	}

	public void setError_message(String error_message) {
		this.error_message = error_message;
	}
	
	

}
