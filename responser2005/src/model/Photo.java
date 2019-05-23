package model;

public class Photo {
	private int p_num ;
	private String p_day; 
	private String p_subject;
	private String p_content;
	private String p_id;
	private String p_addr;
	
	public String getP_addr() {
		return p_addr;
	}
	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_day() {
		return p_day;
	}
	public void setP_day(String p_day) {
		this.p_day = p_day;
	}
	public String getP_subject() {
		return p_subject;
	}
	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public Photo() {}
	public Photo(int p_num, String p_day, String p_subject, String p_content,String p_addr, String p_id) {
		super();
		this.p_num = p_num;
		this.p_day = p_day;
		this.p_subject = p_subject;
		this.p_content = p_content;
		this.p_addr=p_addr;
		this.p_id = p_id;
	}
	
}
