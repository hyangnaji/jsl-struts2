package model;

public class Member {
	private String userid;
	private String userpass;
	private String name;
	private String email;
	private String phone;
	private int open;
	private String address;
	private int m_code;
	
	public Member() {}

	public Member(String userid, String userpass, String name, String email, String phone) {
		this.userid = userid;
		this.userpass = userpass;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.open = 0;
		this.address = "http://localhost:8080/responser2005/world/"+userid+".jsp";
	}
	

	public Member(String userid, String userpass, String name, String email, String phone, int open, String address) {
		super();
		this.userid = userid;
		this.userpass = userpass;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.open = open;
		this.address = address;
	}
	
	public Member(String userid, String userpass, String name, String email, String phone, int open, String address, int m_code) {
		super();
		this.userid = userid;
		this.userpass = userpass;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.open = open;
		this.address = address;
		this.m_code = m_code;
	}


	public Member(String userid, String name, String address) {
		super();
		this.userid = userid;	
		this.name = name;
		this.address = address;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	
	
}
