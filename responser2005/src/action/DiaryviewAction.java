package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import controller.DiaryDAO;
import model.Diary;

public class DiaryviewAction implements Action{
	private int num;
	private String date;
	private String subject;
	private String content;
	private String userid;
	private String memberid;
	private List<Diary>list;
	private Map<String, Object> session ;
	private Diary d;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String)session.get("userid");
		DiaryDAO dao = new DiaryDAO();
		
		if(date == null) {
			list = dao.totalDiary(id);
		}
		
		return SUCCESS;
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

	public List<Diary> getList() {
		return list;
	}

	public void setList(List<Diary> list) {
		this.list = list;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}




}
