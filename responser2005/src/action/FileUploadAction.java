package action;

import java.io.File;

import org.apache.commons.io.FileUtils;

import model.Music;

public class FileUploadAction{
	
	private static final String UPLOADPATH="C:\\track2\\source\\responser2005\\WebContent\\world";
	private static final String MUSICUPLOADEPATH="C:\\track2\\source\\responser2005\\WebContent\\music";
	
	public String copyfile(String userid) throws Exception {
		String result = null;
		
		File oldfile = new File(UPLOADPATH+"\\swlee.jsp");
		File newfile = new File(UPLOADPATH+"\\"+userid+".jsp");
		
		FileUtils.copyFile(oldfile, newfile);
		result = "okay";
		
		return result;
	}
	
	public String musicfile(String musicname, String musicartist, File upload, int code) throws Exception{
		String result = null;
		File userMusic = new File(upload.getAbsolutePath()); 		
		File uploadMusic = new File(MUSICUPLOADEPATH+"\\"+code+".mp3");
		
		FileUtils.copyFile(userMusic, uploadMusic);		
		result = "okay";
		
		return result;		
	}


	
}
