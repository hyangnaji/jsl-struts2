package action;

import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import controller.PhotoDAO;
import model.Photo;

public class PhotoinsertAction extends ActionSupport {
	private int p_num;
	private String p_day;
	private String p_subject;
	private String p_content;
	private String p_id;
	private String p_addr;
	private String img;
	private String message;
	private static final String UploadPath = "C:\\track2\\source\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\responser2005\\img\\"; // 파일의 위치
	private int oldp_num;
	private File upload; // 파일 객체 원래이름
	private String uploadContentType; // 파일의 형테
	private String uploadFileName; // 파일 새로운 이름이름
	private long uploadFileSize;
	private File saveFile;
	private Photo photo;

	public String p_modify() throws Exception {
		int num1 = (int)(Math.random() * 100) + 1;
	
		PhotoDAO dao = new PhotoDAO();
		int num = 0;
		if (upload != null && upload.exists()) {
			img =num1+uploadFileName;
			File new_saveFile = new File( UploadPath + num1+uploadFileName);
			Photo old_photo=dao.selectPhoto(oldp_num);
			Photo new_photo=new Photo(oldp_num, p_day, p_subject, p_content, img, p_id);
			num = dao.modifyPhoto(new_photo);
		
			/*int deleteresult=dao.deletePhoto(old_photo.getP_id(),old_photo.getP_addr());*/
	        // 서버 파일 삭제
			if (num == 1) {
				File deleteFile = new File(UploadPath +old_photo.getP_addr());
			    deleteFile.delete();
			    FileUtils.copyFile(upload, new_saveFile);
			
				FileUtils.forceDelete(upload); 
				
				return SUCCESS;
			} else {
				message = "원모어 타임";
				return ERROR;
			}
		}
		return ERROR;
	}
	
	@Override
	public String execute() throws Exception {

		if (p_day.equals("") || p_content.equals("") || p_subject.equals("")||upload==null) {
			message = "빈 칸이 있으면 안됩니다.";
			return ERROR;
		}
		
		
	int num1=(int)(Math.random() * 100) + 1;
		PhotoDAO dao = new PhotoDAO();
		int num = 0;
		if (upload != null && upload.exists()) {
			
			img =num1+uploadFileName;
			saveFile = new File( UploadPath +num1+ uploadFileName);

		
			FileUtils.copyFile(upload, saveFile);
			
	
			photo = new Photo(0, p_day, p_subject, p_content, img, p_id);
			num = dao.insertPhoto(photo);
		

	
			  FileUtils.forceDelete(upload); 
		}
		if (num == 1) {

			return SUCCESS;
		} else {
			message = "원모어 타임";
			return ERROR;
		}

	}

	
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_day() {
		return p_day;
	}

	public void setP_day(String p_day) {
		this.p_day = p_day;
	}

	public String getP_subject() {
		return p_subject;
	}

	public int getOldp_num() {
		return oldp_num;
	}

	public void setOldp_num(int oldp_num) {
		this.oldp_num = oldp_num;
	}

	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_addr() {
		return p_addr;
	}

	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}

}