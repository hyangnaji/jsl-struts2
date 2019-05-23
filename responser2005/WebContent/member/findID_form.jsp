<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/background.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>아이디찾기</title>
		<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="/responser2005/css/normalize.css">    
	    <link rel="stylesheet" href="/responser2005/css/normalize_style.css">    
	</head>
	<body>
	
	
	<div class="form">      
	     
	      <div class="tab-content">
	        
	          <h1>아이디</h1>
	          
	          <form action="/responser2005/member/findID_findPW.jsp" method="post">
	          
	           <div class="field-wrap">
	            
	            <input type="text" value="${userID}" readonly="readonly"/>
	          
	          </div>
	
	        	<p class="forgot"><a href="/responser2005/member/register_login.jsp">로그인하기</a></p>
	        
	          <button class="button button-block">돌아가기</button>
	          
	          
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