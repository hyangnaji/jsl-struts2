package action;

import com.opensymphony.xwork2.Action;

import controller.MemberDAO;
import model.Member;

public class MusicDeleteAction implements Action{
	private String userid;	
	private String Message;
	
	@Override
	public String execute() throws Exception {
		MemberDAO dao = new MemberDAO();
		Member mem = dao.searchMember(userid);
		
		if(mem.getM_code() == 1) {
			Message = "같음";
			return ERROR;
		}
		
		int res = dao.deleteMusic(userid);
		
		if(res > 0) {
			Message = "성공";
			return SUCCESS;
		}				
		
		Message = "실패";
		return ERROR;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getMessage() {
		return Message;
	}


	public void setMessage(String Message) {
		this.Message = Message;
	}

	
}
