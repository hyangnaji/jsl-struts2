package model;

public class Diary {
	private int num;
	private String date;
	private String subject;
	private String content;
	private String userid;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getString() {
		return date;
	}
	public void setString(String date) {
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
	public String getId() {
		return userid;
	}
	public void setId(String id) {
		this.userid = userid;
	}
	public Diary() {}
	
	public Diary(int num, String date, String subject, String content, String userid) {
		super();
		this.num = num;
		this.date = date;
		this.subject = subject;
		this.content = content;
		this.userid = userid;
	}
}
