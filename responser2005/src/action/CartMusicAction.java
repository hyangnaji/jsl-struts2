package action;

import com.opensymphony.xwork2.Action;

import controller.MemberDAO;
import model.Music;

public class CartMusicAction implements Action{
	private String userid;
	private String musiccode;
	private String musicaddress;
	
	private String errorMessage;
	
	@Override
	public String execute() throws Exception {
		MemberDAO dao = new MemberDAO();
		
		int res = dao.updatemusiccode(Integer.parseInt(musiccode), userid);
			if(res > 0) {
				Music music = null;				
				music = dao.selectmusic(userid, Integer.parseInt(musiccode));
				musicaddress = music.getMusicaddress();
				return SUCCESS;
			}
		
			errorMessage = "업데이트 에러";
			return ERROR;		
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	
	
	public String getMusiccode() {
		return musiccode;
	}

	public void setMusiccode(String musiccode) {
		this.musiccode = musiccode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getMusicaddress() {
		return musicaddress;
	}

	public void setMusicaddress(String musicaddress) {
		this.musicaddress = musicaddress;
	}
	
	
	
	
}
