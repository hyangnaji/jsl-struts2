package action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import controller.MusicDAO;
import model.Music;

public class MusicSearch extends ActionSupport{
	
	private List<Music> list = null;
	private String musicname;
	private String musicartist;
	
	public String musicname() throws Exception{
		MusicDAO dao = new MusicDAO();
		
		List<Music> list = dao.searchMusicname(musicname);
		
		this.list = list;				
		
		return SUCCESS;
	}
	
	public String musicartist() throws Exception{
		
		MusicDAO dao = new MusicDAO();
		
		List<Music> list = dao.searchMusicartist(musicartist);
		
		this.list = list;
		
		return SUCCESS;
	}

	public List<Music> getList() {
		return list;
	}

	public void setList(List<Music> list) {
		this.list = list;
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
	
	
}
