package action;

import com.opensymphony.xwork2.Action;

import controller.MemberDAO;

public class Re_settingAction implements Action {
	private String userid;
	private String username;
	private String useremail;
	private String phone;
	private String userpass;
	private String re_pass;
	
	private String error_message;
	
	@Override
	public String execute() throws Exception {
		int res = 0;
		MemberDAO dao = new MemberDAO();
		
		if(userpass != null) {
			if(userpass.equals(re_pass)) {
				res = dao.updatePW(userid, userpass);
				if(res > 0) {					
					error_message = "비밀번호 재설정이 완료되었습니다. 다시 로그인 해주세요.";
					return SUCCESS;
					
				}else {
					error_message = "오류! 다시 한 번 시도해주세요.";
					return ERROR;
				}
			}
				error_message = "비밀번호가 일치하지 않습니다.";
				return ERROR;
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
	
	

}
