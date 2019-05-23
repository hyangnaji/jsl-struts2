<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정 및 탈퇴</title>
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/responser2005/css/normalize.css">    
    <link rel="stylesheet" href="/responser2005/css/normalize_style.css">
  <style type="text/css">

    
    a {
   color: #c8c8c8;
}

a:hover {
   color: #FF6679;
}

  </style>
    <% 
     String path = (String)ActionContext.getContext().getSession().get("memberid");   
    %>
    </head>
<body>
<div class="form">      
  <div class="col-md-1 home" style="float:left">
         <a href="http://localhost:8080/responser2005/world/<%=path%>.jsp" onclick="window.close();" target="_blank">
               <i class="material-icons">뒤로</i>
         </a>
      </div>

         <div class="tab-content">
     
             <h1>회원수정</h1>
             
             <form action="modify.action" method="post">
               <div class="field-wrap">
                <label>
                   아이디<span class="req">*수정불가</span>
               </label>               
               <input type="text" value="${userid}" name = "userid" readonly="readonly"/>
             </div>
             
              <div class="field-wrap">
               <label>
                   비밀번호<span class="req">*최소 6자</span>
               </label>
               <input type="password" pattern=".{6,}" name="userpass" required autocomplete="off"/>
             </div>
             
             <div class="field-wrap">
               <label>
                   비밀번호확인<span class="req">*</span>
               </label>
               <input type="password" pattern=".{6,}" name="re_pass" required autocomplete="off"/>
             </div>
             
             <div class="field-wrap">
               <label>
                   이름<span class="req">*수정불가</span>
               </label>
               <input type="text" value="${username}" name = "username" readonly="readonly"/>
             </div>
             
             <div class="field-wrap">
               <label>
                   이메일<span class="req"></span>
               </label>
               <input type="email" value="${useremail}" name = "useremail" />
             </div>
             
              <div class="field-wrap">
              <label>
                  전화번호<span class="req">*(01012345678)</span>
              </label>
              <input type="tel" pattern="(010)\d{8}" name ="phone" value = "${phone}" required autocomplete="off" />
            </div>
            
            <p class="forgot" style="color: red">${errorMessage}</p>
                <p class="forgot"><a onclick="leaveout();">회원탈퇴</a></p>
         
             <button class="button button-block">완료</button>
             
             
             </form>
   
          
   
         </div><!-- tab-content -->
         
   </div> <!-- /form -->
      
   </body>
   
   <script type="text/javascript">
   function sessionout(){
      opener.location.href = "http://localhost:8080/responser2005/logout.action";
      window.close();
   }
   
   function leaveout(){
      opener.location.href = "http://localhost:8080/responser2005/leave.action";
      window.close();
   }

   </script>
   
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
     
     function sessionout(){
         opener.location.href = "http://localhost:8080/responser2005/logout.action";
         window.close();
      }

       </script>
</html>