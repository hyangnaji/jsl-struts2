package action;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import controller.DiaryDAO;

public class DiarydeleteAction implements Action{
	private int num;
	private String date;
	private String subject;
	private String content;
	private String userid;
	private Map<String, Object> session ;
	
	@Override
	public String execute() throws Exception {
	
		DiaryDAO dao =new DiaryDAO();
		ActionContext context = ActionContext.getContext();
		session =context.getSession();
		String  id=(String)session.get("userid");
		
		int num=dao.deleteDiary(id, date);
		if(num==1)
		return SUCCESS;
		
		return ERROR;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

}
