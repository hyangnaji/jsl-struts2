package action;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import controller.DiaryDAO;
import model.Diary;

public class DiarymodifyAction implements Action{
	private int num;
	private String date;
	private String subject;
	private String content;
	private String userid;
	private Map<String, Object> session ;
	private Diary diary;
	private String error_msg;

	@Override
	public String execute() throws Exception {
		/*if (content.equals("") || subject.equals("")) {
			error_msg = "제목/내용을 담아주세요";
			return ERROR;
		}*/
		ActionContext context = ActionContext.getContext();
		session =context.getSession();
	
		userid=(String)session.get("userid");
		DiaryDAO dao = new DiaryDAO();
		diary = new Diary(0,date,subject,content,userid);
		int num=dao.modifyDiary(diary);
		if(num==1)
			return SUCCESS;
		
		return ERROR;
	}
	
	public String getError_msg() {
		return error_msg;
	}

	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
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

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

}
