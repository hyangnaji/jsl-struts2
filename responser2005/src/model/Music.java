package model;

public class Music {
	private int musiccode;
	private String musicname;
	private String musicartist;
	private String musicaddress;
	
	public Music() {}
	
	public Music(int musiccode, String musicname, String musicartist, String musicaddress) {
		super();
		this.musiccode = musiccode;
		this.musicname = musicname;
		this.musicartist = musicartist;
		this.musicaddress= musicaddress;
	}
	
	public Music(int musiccode, String musicname, String musicartist) {
		super();
		this.musiccode = musiccode;
		this.musicname = musicname;
		this.musicartist = musicartist;
	}
	

	public Music(String musicname, String musicartist) {
		super();
		this.musicname = musicname;
		this.musicartist = musicartist;
	}

	public int getMusiccode() {
		return musiccode;
	}

	public void setMusiccode(int musiccode) {
		this.musiccode = musiccode;
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

	public String getMusicaddress() {
		return musicaddress;
	}

	public void setMusicaddress(String musicaddress) {
		this.musicaddress = musicaddress;
	}
	
	
	
}
