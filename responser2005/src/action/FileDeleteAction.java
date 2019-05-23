package action;

import java.io.File;
import java.util.List;

import controller.PhotoDAO;
import model.Photo;

public class FileDeleteAction{
	
	private static final String DELETEPATH_USER="C:\\track2\\source\\responser2005\\WebContent\\world\\";
	private static final String DELETEPATH_IPIC="C:\\track2\\source\\responser2005\\WebContent\\memberimg\\";
	private static final String DELETEPATH_PHOTO="C:\\track2\\source\\responser2005\\WebContent\\img\\";
	
	public boolean deletefile(String userid) throws Exception {
		boolean result = false;
				
		File jspfile = new File(DELETEPATH_USER+userid+".jsp");
		File memimg = new File(DELETEPATH_IPIC+userid+".jpg");
		
		PhotoDAO photo = new PhotoDAO();
		List<Photo> list = photo.phtoList(userid);
		
		if(list != null) {
			for(int i =0; i<list.size(); i++) {
				File img = new File(DELETEPATH_PHOTO+list.get(i).getP_addr());
				result = img.delete();
			}
		}
		
		if(jspfile.exists()) {
			result = jspfile.delete();	//return값이 boolean	
			if(memimg.exists()) {
				result = memimg.delete();
			}
		}
		
		return result;
	}


	
}
