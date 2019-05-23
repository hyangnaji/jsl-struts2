package action;

import com.opensymphony.xwork2.Action;

import controller.MemberDAO;

public class FindIDAction implements Action{
	private String username;
	private String useremail;
	private String phone;
	
	private String userID;
	private String error_message;

	@Override
	public String execute() throws Exception {
		
		
		MemberDAO dao = new MemberDAO();
		String id = dao.searchID(username, useremail, phone);
		
		if(id.equals(null)) {
			error_message = "아이디가 존재하지 않습니다.";
			return ERROR;
		}
		
		userID = id;
		
		return SUCCESS;
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


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getError_message() {
		return error_message;
	}


	public void setError_message(String error_message) {
		this.error_message = error_message;
	}
	
	

}
