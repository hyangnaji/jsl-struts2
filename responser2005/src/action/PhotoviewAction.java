package action;

import com.opensymphony.xwork2.Action;

import controller.PhotoDAO;
import model.Photo;

public class PhotoviewAction implements Action {
	private int p_num ;
	private String p_day; 
	private String p_subject;
	private String p_content;
	private String p_id;
	private Photo photo;
	
	private String memberid;

	@Override
	public String execute() throws Exception {
		PhotoDAO dao = new PhotoDAO();
		photo = new Photo();
		
		photo=dao.selectPhoto(p_num);
		if(photo!=null) {
			return SUCCESS;
		}
		
		return ERROR;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
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

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}
