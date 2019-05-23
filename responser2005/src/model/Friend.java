package model;

public class Friend {
	private String f_name; 
	private String	f_id;
	private String f_nickname;
	private String f_mid;
	private String fr_address;
	public String getF_name() {
		return f_name;
	}
	
	public String getFr_address() {
		return fr_address;
	}

	public void setFr_address(String fr_address) {
		this.fr_address = fr_address;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getF_nickname() {
		return f_nickname;
	}
	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}
	public String getF_mid() {
		return f_mid;
	}
	public void setF_mid(String f_mid) {
		this.f_mid = f_mid;
	}
	public Friend(String f_name, String f_id, String f_nickname, String f_mid) {
		super();
		this.f_name = f_name;
		this.f_id = f_id;
		this.f_nickname = f_nickname;
		this.f_mid = f_mid;
		this.fr_address = "http://localhost:8080/responser2005/world/"+f_id+".jsp";
	}
	public Friend() {

	} 
	
	
}
