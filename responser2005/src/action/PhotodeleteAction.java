package action;

import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import controller.PhotoDAO;
import model.Photo;

public class PhotodeleteAction extends ActionSupport{
	private int p_num ;
	private String p_day; 
	private String p_subject;
	private String p_content;
	private String p_id;
	private String p_addr;
	Map<String, Object> session;
	private String id;
	private static final String UploadPath = "C:\\track2\\source\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\responser2005\\img\\"; // 파일의 위치
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		id = (String) session.get("userid");
		PhotoDAO dao = new PhotoDAO();
		int num=dao.deletePhoto(id,p_addr);
        // 서버 파일 삭제
        File deleteFile = new File(UploadPath +p_addr);
        deleteFile.delete();

		if(num == 1)
			return SUCCESS;
		
		return ERROR;
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
/*
import com.opensymphony.xwork2.ActionSupport;



import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.io.File;
import java.io.Reader;
import java.io.IOException;

 

public class deleteAction extends ActionSupport
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private boardVO paramClass; // 파라미터를 저장할 객체
      private boardVO resultClass; // 쿼리 결과 값을 저장할 객체
 
      private int currentPage; // 현재 페이지
 
      private String fileUploadPath = "d:\\udload\\";
 
      private int no;
 
      // 생성자
      public deleteAction() throws IOException
      {
            // sqlMapConfig.xml 파일의 설정내용을 가져온다.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // 게시글 글 삭제
      public String execute() throws Exception
      {
            // 파라미터와 리절트 객체 생성
            paramClass = new boardVO();
            resultClass = new boardVO();
  
            // 해당 번호의 글을 가져온다.
            resultClass = (boardVO)sqlMapper.queryForObject("selectOne", getNo());
  
            // 서버 파일 삭제
            File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
            deleteFile.delete();
  
            // 삭제할 항목 설정
            paramClass.setNo(getNo());
  
            // 삭제 쿼리 수행
            sqlMapper.update("deleteBoard", paramClass);
  
            return SUCCESS;
      }
 
      public boardVO getParamClass() { return paramClass; }
      public void setParamClass(boardVO paramClass) { this.paramClass = paramClass; }
 
      public int getNo() { return no; }
      public void setNo(int no) { this.no = no; }
 
      public boardVO getResultClass() { return resultClass; }
      public void setResultClass(boardVO resultClass) { this.resultClass = resultClass; }
 
      public int getCurrentPage() { return currentPage; }
      public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }
}

*/

