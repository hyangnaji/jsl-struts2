package action;


import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import controller.InfoDAO;
import controller.MemberDAO;
import controller.MusicDAO;
import model.Info;
import model.Member;
import model.Music;

public class LoginAction extends ActionSupport{
	private String userid;
	private String userpass;
	private String re_pass;
	private String username;
	private String useremail;
	private String phone;
	private int m_code;
	
	private String errorMessage;
	private String message;
	
	private String musiccode;
	private String musicaddress;
	
	private String i_id;
	private String i_address;
	private String i_name;
	private String i_intro;
	private int i_open;
	private int i_hit;
	private int i_totlahit;
	
	public String index() throws Exception{
		  if(ActionContext.getContext().getSession().get("userid") == null) return LOGIN;
		  
		  else return SUCCESS;
		 }
		 
		 /**
		  * login 부분
		  */

		 public String login() throws Exception{
			 
			 if(userid.equals("")||userpass.equals("")) {
					errorMessage = "아이디 또는 비밀번호를 입력해주세요";
					return ERROR;
				}
				
				MemberDAO dao = new MemberDAO();
				Member mem = null;
				
				mem = dao.searchMember(userid);
				InfoDAO infodao = new InfoDAO();
				
				Info info = infodao.selectInfo(userid);
				
				if(mem == null) {
					errorMessage = "존재하지 않는 회원입니다.";
					return ERROR;
				}else if(mem.getUserid().equals(userid) && !(mem.getUserpass().equals(userpass))) {
					errorMessage = "비밀번호를 확인해주세요";
					return ERROR;
				}
				
			  ActionContext context = ActionContext.getContext();//session을 생성하기 위해
			  Map<String, Object> session = (Map<String, Object>)context.getSession();// Map 사용시
			  session.put("userid", userid);
			  session.put("userpass", userpass);
			  session.put("username", mem.getName());
			  session.put("useremail", mem.getEmail());
			  session.put("phone", mem.getPhone());
			  
			  if(info != null) {
			  session.put("i_id", userid);
			  session.put("i_address", info.getI_address());
			  session.put("i_name", info.getI_name());
			  session.put("i_intro", info.getI_intro());
			  session.put("i_pic", info.getI_pic());
			  }
			  
			  if(mem.getM_code() > 0) {	//member가 음악을 가지고 있을 시 추가하는 세션
					MusicDAO musicdao = new MusicDAO();
					Music music = musicdao.selectcode(mem.getM_code());
					
					session.put("m_code", music.getMusiccode());
				}			  
			  context.setSession(session);
		  
		  return SUCCESS;
		 }
		 
		 /**
		  * logout 부분
		  */

		 public String logout() throws Exception{
		  ActionContext context = ActionContext.getContext();
		  Map<String, Object> session = (Map<String, Object>)context.getSession();
		  if(session.get("userid") != null){
		   session.remove("userid");
		   session.remove("userpass");
		   session.remove("username");
		   session.remove("useremail");
		   session.remove("phone");
		   if(m_code > 0) {		//member가 음악을 가지고 있을 시 세션 만료시키는 코드
			   session.remove("m_code");				
			}			   
		  }
		  
		  if(session.get("memberid")!=null) {
			  session.remove("memberid");
		  }
		  
		  session.remove("i_id");
		  session.remove("i_address");
		  session.remove("i_name");
		  session.remove("i_intro");
		  session.remove("i_pic");

		  context.setSession(session);
		  
		  message = "아웃완료";
		 
		 return SUCCESS;
		 }
		 
		 /**
		  * modify 부분
		  */
		 
		 public String modify() throws Exception{	//멤버 수정 세션만 만료시켰다가 다시 등록시키는 메서드
			 
			 if(!userpass.equals(re_pass)) {
					errorMessage ="비밀번호가 일치하지 않습니다.";
					return ERROR;
				}					
				
				MemberDAO dao = new MemberDAO();
				Member mem = null;
				
				mem = dao.searchMember(userid);	
				
				if(mem == null) {
					errorMessage = "오류! 다시시도해주세요.";
					return ERROR;
				}
				
				int res = dao.modifymem(userpass, useremail, phone, userid);
				
				if(res > 0) {										 
					Map<String, Object> session = ActionContext.getContext().getSession();
									 
					session.remove("userid");
					session.remove("userpass");
					session.remove("username");
					session.remove("useremail");
					session.remove("phone");				 
						 
					session.put("userid", userid);
					session.put("userpass", userpass);
					session.put("username", username);
					session.put("useremail", useremail);
					session.put("phone", phone);
						  			
					ActionContext.getContext().setSession(session);
					 
					message = "수정완료";
					return SUCCESS;	
				}
				
				errorMessage = "오류! 다시시도해주세요.";
				return ERROR;
			}
		 
		 /**
		  * modify_info 부분
		  */
		 
		 public String modify_info() throws Exception{	//폼 수정
			 
				InfoDAO dao = new InfoDAO();
				Info info = null;
				
				info = dao.selectInfo(i_id);
				MemberDAO daomem = new MemberDAO();
				Member mem = null;
				
				mem = daomem.searchMember(userid);	
				
				if(info == null) {
					errorMessage = "오류! 다시시도해주세요.";
					return ERROR;
				}
				
				int res = dao.modify_home(info);
				
				if(res > 0) {										 
					Map<String, Object> session = ActionContext.getContext().getSession();
					
					 session.remove("i_id");
					 session.remove("i_address");
					 session.remove("i_name");
					 session.remove("i_intro");
					 session.remove("i_pic");
					
					 
					session.put("i_id", userid);
					session.put("i_address", info.getI_address());
					session.put("i_name", info.getI_name());
					session.put("i_intro", info.getI_intro());
					session.put("i_pic", info.getI_pic());
						  			
					ActionContext.getContext().setSession(session);
					 
					message = "수정완료";
					return SUCCESS;	
				}
				
				errorMessage = "오류! 다시시도해주세요.";
				return ERROR;
			}
		 
			
		 
		 /**
		  * leave 부분
		  */
		 
		 public String leave() throws Exception{
			 
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>)context.getSession();
			 
			int res = 0;
			MemberDAO dao = new MemberDAO();
			res = dao.deleteMember(session.get("userid").toString());
			
			if(res > 0) {
				
				FileDeleteAction delete = new FileDeleteAction();
				
				boolean result = delete.deletefile(session.get("userid").toString());
				if(result) {
				  if(session.get("userid") != null){	//member의 세션을 가지고 있을 때 실행
					  session.remove("userid");
					  session.remove("userpass");
					  session.remove("username");
					  session.remove("useremail");
					  session.remove("phone");
					  
					  session.remove("i_id");
					  session.remove("i_address");
					  session.remove("i_name");

				  }
				   	  context.setSession(session);		//세션 다시 등록(null 값)
										
					message = "탈퇴완료";
					return SUCCESS;
				}
			}
			errorMessage = "오류!";
			return ERROR;
		 }
		 
		 /**
		  * modifymusic 부분
		  */
		 
		 public String modifymusic() throws Exception{
			 
				MemberDAO dao = new MemberDAO();
				Member mem = null;				
				
				mem = dao.searchMember(userid);	
				
				if(mem == null) {
					errorMessage = "오류! 다시시도해주세요.";
					return ERROR;
				}
				
				int res = dao.updatemusiccode(Integer.parseInt(musiccode), userid);
				
				if(res > 0) {										 
					Map<String, Object> session = ActionContext.getContext().getSession();
					session.remove("m_code");		

					if(Integer.parseInt(musiccode) > 0) {	//musiccode를 가지고 있을 시
						session.put("m_code", Integer.parseInt(musiccode));
					}			  
					
					ActionContext.getContext().setSession(session);	//세션에 추가 등록
					 
					message = "수정완료";
					return SUCCESS;	
				}
				
				errorMessage = "오류! 다시시도해주세요.";
				return ERROR;
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


	public String getErrorMessage() {
		return errorMessage;
	}


	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}


	public String getRe_pass() {
		return re_pass;
	}


	public void setRe_pass(String re_pass) {
		this.re_pass = re_pass;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	public String getMusiccode() {
		return musiccode;
	}

	public void setMusiccode(String musiccode) {
		this.musiccode = musiccode;
	}

	public String getMusicaddress() {
		return musicaddress;
	}

	public void setMusicaddress(String musicaddress) {
		this.musicaddress = musicaddress;
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

	public int getI_hit() {
		return i_hit;
	}

	public void setI_hit(int i_hit) {
		this.i_hit = i_hit;
	}

	public int getI_totlahit() {
		return i_totlahit;
	}

	public void setI_totlahit(int i_totlahit) {
		this.i_totlahit = i_totlahit;
	}
	
	
	

}
