<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="model.Info"%>
<%@page import="controller.InfoDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/responser2005/css/normalize.css">    
<link rel="stylesheet" href="/responser2005/css/normalize_style.css">    
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="/responser2005/css/hpmain_css.css" rel="stylesheet" type="text/css"/>
<!-- 홈피 수정 -->
</head>
<body>
<script type="text/javascript"> 
function getCmaFileView() {
	//파일정보
	var fileObj = document.nhForm.upload.files[0];
	var fileObjValue = document.getElementById('upload').value;
	var img_all_names = fileObj['name'].split('.');
	var name = img_all_names[0];//이미지 이름
	var ext = img_all_names[1].toLowerCase();//확장자
	var size = fileObj['size'];//파일사이즈
	//var ext2 = fileObj['type'].toLowerCase();//확장자

	//이미지 확장자 검사
	if(ext != 'jpg') {
	alert('jpg 확장자만 가능합니다');
	fileObjValue = '';
	return false;
	}

	//이미지 파일 사이즈
	if(size >= parseInt(10485760)) {
	alert('10MB까지만 가능합니다');
	fileObjValue = '';
	return false;
	}

	return true;
}

</script>
<%
	InfoDAO dao = new InfoDAO();
	Info info = null;
	String id = (String)ActionContext.getContext().getSession().get("userid");
	info = dao.selectInfo(id);
	if(info != null){
		if(info.getI_pic() != null){
		File file = new File(info.getI_pic());
		}
	String file = info.getI_id();
	}
	
	
%>			
	<div class="form">    
	<div class="goback">
		<div class="col-md-1 home">
			<button class="h_btn" onclick="location.href='http://localhost:8080/responser2005/world/<%=id%>.jsp'" id="diary" target="_blank">
					<i class="material-icons">home</i>
			</button>
		</div>
		
		</div>  
	      <div class="tab-content">
	       <form action="home_modify.action" method="post" enctype="multipart/form-data">
	       <div class="field-wrap">
	      	<label>
	           	 홈피명<span class="req">*2글자 이상</span>
	        </label>
          	<input type="text" name="i_name" value="<%=info.getI_name()%>" pattern = ".{4,}" required autocomplete="off" />
	      	</div>
	       
	      	<div class="field-wrap">
	      	<label>
	           	 프로필 사진<span class="req"></span>
	        </label>
          	<input type="file" id="upload" name="upload" size="50" accept=".jpg" value="<%=info.getI_pic()%>" onchange='getCmaFileView()'/>
	      	</div>
	      	
	      	<div class="field-wrap">
	      	<label>
	           	 내 소개<span class="req"></span>
	        </label>
          	<textarea id="i_intro" name="i_intro" placeholder="내 매력을 소개해보아요 ^^"><%=info.getI_intro() %></textarea>
	      	</div>
	      	
	      	<div class="field-wrap">
	      	<label>
	           	 정보공개<span class="req">phone/e-mail의 정보 공개설정</span>				<!-- 여기 라디오 디자인 수정 잘 부탁해욤 -->
	        </label>
          	<input type="radio" name = "i_open" value="0" checked="checked">공개
          	<input type="radio" name = "i_open" value="1">비공개
	      	</div>	      	
			
			<input type="hidden" name="i_id" value="${userid}"/>
			
			<p style="color: red">${message}</p>
			
	      <button type="button" class="button button-block" onclick="history.back(-1)">돌아가기</button>
	      <button class="button button-block">수정</button>
	      </form>   
	 </div><!-- tab-content -->
	</div> <!-- /form -->
	
</body>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	        <script src="js/index.js"></script>
	     
	        
	    <script type="text/javascript">
	    
	    $(".form")
	    .find("input, textarea")
	    .on("keyup blur focus", function(e) {
	      var $this = $(this),
	        label = $this.prev("label");
	
	      if (e.type == "keyup") {
	        if ($this.val() == "") {
	          label.removeClass("active highlight");
	        } else {
	          label.addClass("active highlight");
	        }
	      } else if (e.type == "blur") {
	        if ($this.val() == "") {
	          label.removeClass("active highlight");
	        } else {
	          label.removeClass("highlight");
	        }
	      } else if (e.type == "focus") {
	        if ($this.val() == "") {
	          label.removeClass("highlight");
	        } else if ($this.val() != "") {
	          label.addClass("highlight");
	        }
	      }
	    });
	
	  $(".tab a").on("click", function(e) {
	    e.preventDefault();
	
	    $(this)
	      .parent()
	      .addClass("active");
	    $(this)
	      .parent()
	      .siblings()
	      .removeClass("active");
	
	    target = $(this).attr("href");
	
	    $(".tab-content > div")
	      .not(target)
	      .hide();
	
	    $(target).fadeIn(600);
	  });    
	    </script>



</html>



