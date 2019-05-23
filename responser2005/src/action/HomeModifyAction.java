package action;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;

import controller.InfoDAO;
import controller.MemberDAO;
import model.Info;
import model.Member;
import model.Photo;

public class HomeModifyAction implements Action{
	
	private String i_id;
	private String i_name;
	private File upload;
	private File newupload;
	private String i_intro;
	private String i_pic;
	private int i_open;
	
	private String message;
	
	private static String UPLOADPATH = "C:\\track2\\source\\responser2005\\WebContent\\memberimg\\";
	
	@Override
	public String execute() throws Exception {
		InfoDAO dao = new InfoDAO();
		
		Info infom = null;
		infom = dao.selectInfo(i_id);
		
		if(infom != null) {
			if (upload != null && upload.exists()) {
				newupload = new File( UPLOADPATH + i_id + ".jpg");
				
				Info info = dao.selectInfo(i_id); 
				Info old_info = dao.selectInfo(i_id);
				Info new_info = new Info(info.getI_id(), i_name, newupload.getAbsolutePath(), i_intro, i_open);
				int num = 0;
				num = dao.modify_home(new_info);
				
				if (num == 1) {
					File deleteFile = new File(UPLOADPATH +old_info.getI_address());
					deleteFile.delete();
					FileUtils.copyFile(upload, newupload);
					FileUtils.forceDelete(upload); 

					return SUCCESS;
				}else {
					
					return SUCCESS;
				}
				
				
			}else {
				Info new_info = new Info(infom.getI_id(), i_name, i_intro, i_open);
				int num = dao.modify_Noimage(new_info);
				if(num > 0) {
					return SUCCESS;
				}
				
			}
		}
		message ="오류데스";
		return ERROR;

	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public File getNewupload() {
		return newupload;
	}

	public void setNewupload(File newupload) {
		this.newupload = newupload;
	}

	public String getI_intro() {
		return i_intro;
	}

	public void setI_intro(String i_intro) {
		this.i_intro = i_intro;
	}

	public String getI_pic() {
		return i_pic;
	}

	public void setI_pic(String i_pic) {
		this.i_pic = i_pic;
	}

	public int getI_open() {
		return i_open;
	}

	public void setI_open(int i_open) {
		this.i_open = i_open;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}	
	
	

}
