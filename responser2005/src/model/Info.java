package model;

import java.sql.Date;

public class Info {
	private String i_id;			//홈피 아이디
	private String i_address;		//홈피 주소
	private String i_name;			//홈피 타이틀
	private String i_pic;			//개인프로필 사진
	private String i_intro;			//개인 소개
	private int i_open;				//정보공개||비공개
	
	public Info() {}

	public Info(String i_id, String i_address, String i_name, String i_pic, String i_intro, int i_open) {
		super();
		this.i_id = i_id;
		this.i_address = i_address;
		this.i_name = i_name;
		this.i_pic = i_pic;
		this.i_intro = i_intro;
		this.i_open = i_open;
	}

	public Info(String userid, String address, String name, String i_pic) {
		super();
		this.i_id = userid;
		this.i_address = address;
		this.i_name = name;
		this.i_pic = i_pic;
	}

	public Info(String i_id, String i_name, String i_pic, String i_intro, int i_open) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.i_pic = i_pic;
		this.i_intro = i_intro;
		this.i_open = i_open;
	}

	public Info(String i_id, String i_name, String i_intro, int i_open) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.i_intro = i_intro;
		this.i_open = i_open;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public String getI_address() {
		return i_address;
	}

	public void setI_address(String i_address) {
		this.i_address = i_address;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getI_pic() {
		return i_pic;
	}

	public void setI_pic(String i_pic) {
		this.i_pic = i_pic;
	}

	public String getI_intro() {
		return i_intro;
	}

	public void setI_intro(String i_intro) {
		this.i_intro = i_intro;
	}

	public int getI_open() {
		return i_open;
	}

	public void setI_open(int i_open) {
		this.i_open = i_open;
	}

	
	
}
