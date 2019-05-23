package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import controller.PhotoDAO;
import model.Photo;

public class IteratorAction implements Action{
	private List<Photo> p_list;
	private Map<String,Object>session;
	private Photo photo;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		String id = (String)session.get("userid");
		PhotoDAO dao = new PhotoDAO();
		
		p_list = dao.phtoList(id);
		if(p_list!=null)
			return SUCCESS;
		
		return ERROR;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public List<Photo> getP_list() {
		return p_list;
	}

	public void setP_list(List<Photo> p_list) {
		this.p_list = p_list;
	}

}
