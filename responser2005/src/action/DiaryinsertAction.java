package action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import controller.DiaryDAO;
import controller.MemberDAO;
import model.Diary;

public class DiaryinsertAction implements Action, SessionAware, Preparable, ModelDriven {
	private int num;
	private String date;
	private String subject;
	private String content;
	private String id;
	Map<String, Object> session;
	private String error_msg;
	private Diary diary;

	@Override
	public String execute() throws Exception {
		/*if (content.equals("") || subject.equals("")) {
			error_msg = "제목/내용을 담아주세요";
			return ERROR;
		}*/
		DiaryDAO dao = new DiaryDAO();
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		id = (String) session.get("userid");
		
		int num = dao.insertDiary(date, subject, content, id);
		if (num == 1)
			return SUCCESS;

		return ERROR;
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

	public Diary getD() {
		return diary;
	}

	public void setD(Diary diary) {
		this.diary = diary;
	}

	public String getError_msg() {
		return error_msg;
	}

	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return diary;
	}

	@Override
	public void prepare() throws Exception {

		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		DiaryDAO dao = new DiaryDAO();
		if ((String) session.get("date") != null) {
			date = (String) session.get("date");
			id = (String) session.get("userid");
			diary = dao.dateDiary(id, date);

		}
	}
}
