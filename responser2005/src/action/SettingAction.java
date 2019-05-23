package action;

import com.opensymphony.xwork2.ActionSupport;

public class SettingAction extends ActionSupport{
	private String userid;
	
	public String modify_leave() throws Exception {
		return SUCCESS;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
