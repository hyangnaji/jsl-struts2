package action;

import com.opensymphony.xwork2.Action;

import controller.InfoDAO;
import controller.MemberDAO;
import model.Info;
import model.Member;

public class JoinAction implements Action{
	private String userid;
	private String userpass;
	private String re_pass;
	private String username;
	private String useremail;
	private String phone;
	
	private String errorMessage;
	
	private String message;
	
	@Override
	public String execute() throws Exception {
		
		Member mem = null;
		MemberDAO dao = new MemberDAO();
		
		mem = dao.searchMember(userid);
		
		if(mem != null || userid.equals("default")) {
			errorMessage = "존재하는 아이디입니다.";
			return ERROR;
		}		
		
		if(!userpass.equals(re_pass)) {
			errorMessage = "비밀번호가 맞지 않습니다.";
			return ERROR;
		}		
		
		mem = new Member(userid, userpass, username, useremail, phone);
		
		int res = dao.insertMember(mem);
		
		if(res>0) {
			FileUploadAction address = new FileUploadAction();
			String result = address.copyfile(userid);
			
			if(result.equals("okay")) {
				Info info = null;
				Member infomember = dao.searchMember(userid);
				info = new Info(userid, infomember.getAddress(), infomember.getName()+"님의 미니홈피", "C:\\track2\\source\\responser2005\\WebContent\\memberimg\\default.jpg");
				
				InfoDAO infodao = new InfoDAO();
				int okay = infodao.insertInfo(info);
				
				if(okay > 0) {
					message = "가입완료";
					return SUCCESS;
				}				
				errorMessage = "홈피정보등록오류";
				return ERROR;
			}
			errorMessage = "홈피파일등록오류";
			return ERROR;
		}
		errorMessage = "멤버등록오류";
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

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
}
