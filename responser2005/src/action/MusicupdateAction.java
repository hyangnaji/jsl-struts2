package action;

import java.io.File;

import com.opensymphony.xwork2.Action;

import controller.MusicDAO;
import model.Music;

public class MusicupdateAction implements Action{
	private String musicname;
	private String musicartist;
	private File upload;
	
	private String errorMessage;
	private String message;
	
	@Override
	public String execute() throws Exception {
		MusicDAO dao = new MusicDAO();
		Music music = null;
		
		music = dao.searchMusiccode(musicname, musicartist);
		
		if(music != null) {
			String MUSICUPLOADEPATH="C:\\track2\\source\\responser2005\\WebContent\\music";
			int code = music.getMusiccode();
			File musicaddress = new File(MUSICUPLOADEPATH+"\\"+code + ".mp3");
			
			int res = 0;
			res = dao.updateMusicaddress(code, musicaddress);
			
			if(res > 0) {
				message = "complete";	
				return SUCCESS;
			}

			errorMessage = "주소 업데이트 오류";
			return SUCCESS;
		}		
		
		errorMessage = "주소 오류";
		return SUCCESS;
	}

	public String getMusicname() {
		return musicname;
	}

	public void setMusicname(String musicname) {
		this.musicname = musicname;
	}

	public String getMusicartist() {
		return musicartist;
	}

	public void setMusicartist(String musicartist) {
		this.musicartist = musicartist;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

	
	
	
}
