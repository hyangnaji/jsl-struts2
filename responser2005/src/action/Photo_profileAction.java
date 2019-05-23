package action;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;

import controller.InfoDAO;

public class Photo_profileAction implements Action{
	private String p_addr;
	private String userid;
	private String message;
	
	private static final String UploadPath = "C:\\track2\\source\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\responser2005\\img\\";
	private static final String UPLOADPATH = "C:\\track2\\source\\responser2005\\WebContent\\memberimg\\";
	
	@Override
	public String execute() throws Exception {
		InfoDAO dao = new InfoDAO();
		
		int res = dao.updatePhoto(UploadPath+p_addr, userid);
		if(res > 0) {
			File file = new File(UploadPath+p_addr);
			File newFile = new File(UPLOADPATH+userid+".jpg");
			
			FileUtils.copyFile(file, newFile);
			
			message = "성공";
			return SUCCESS;
		}		
		message = "실패";
		return ERROR;
	}

	public String getP_addr() {
		return p_addr;
	}

	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
