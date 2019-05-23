package action;

import java.io.File;

import com.opensymphony.xwork2.Action;

import controller.MusicDAO;
import model.Music;

public class MusicAction implements Action{
	private String musicname;
	private String musicartist;
	private File upload;
	
	private String errorMessage;
	private String message;

	@Override
	public String execute() throws Exception {
		
		Music music = null;
		MusicDAO dao = new MusicDAO();
		
		music = dao.searchMusicname(musicname, musicartist);		//노래제목, 가수의 객체
		
		if(music != null) {
			errorMessage = "이미 등록 되어 있는 곡입니다.";
			return ERROR;
		}
		
		int res = dao.insertMusic(musicname, musicartist);			//노래제목, 가수만 등록
		
		if(res > 0) {
			FileUploadAction fua = new FileUploadAction();
			
			String result = null;
			music = dao.searchMusiccode(musicname, musicartist);
			result = fua.musicfile(musicname, musicartist, upload, music.getMusiccode());
			
			if(result.equals("okay")) {
				return SUCCESS;
			}
			
			errorMessage = "파일복사 오류";
			return ERROR;
		}	
		
		errorMessage = "등록오류";
		return ERROR;	
		
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
