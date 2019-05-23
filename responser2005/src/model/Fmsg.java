package model;

public class Fmsg {
	private  int f_num;
	private String f_msg;
	private String f_toid;
	private String f_tonick;
	private String f_fromid;
	private String f_address;

	
	public String getF_address() {
		return f_address;
	}
	public void setF_address(String f_address) {
		this.f_address = f_address;
	}
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getF_msg() {
		return f_msg;
	}
	public void setF_msg(String f_msg) {
		this.f_msg = f_msg;
	}
	public String getF_toid() {
		return f_toid;
	}
	public void setF_toid(String f_toid) {
		this.f_toid = f_toid;
	}
	public String getF_fromid() {
		return f_fromid;
	}
	public void setF_fromid(String f_fromid) {
		this.f_fromid = f_fromid;
	}

	public String getF_tonick() {
		return f_tonick;
	}
	public void setF_tonick(String f_tonick) {
		this.f_tonick = f_tonick;
	}
	public Fmsg() {
		super();
	}
	public Fmsg(int f_num, String f_msg, String f_toid,String f_tonick, String f_fromid) {
		super();
		this.f_num = f_num;
		this.f_msg = f_msg;
		this.f_toid = f_toid;
		this.f_tonick=f_tonick;
		this.f_fromid = f_fromid;
		this.f_address = "http://localhost:8080/responser2005/world/"+f_fromid;
	} 
	
	
}
