<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
   href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
   rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/responser2005/css/normalize.css">
<link rel="stylesheet" href="/responser2005/css/normalize_style.css">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
.form {
   position: relative;
}

.sidenav {
   position: absolute;
   top: -50px;
   right: 0;
}

#mySidenav a {
   transition: 0.3s;
   padding: 15px;
   width: 100px;
   text-decoration: none;
   font-size: 20px;
   color: white;
   border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
   right: -5px;
}

#goback {
   top: 80px;
   background-color: #FFE278;
}

#modify {
   top: 140px;
   background-color: #E1F04A;
}

#projects {
   top: 200px;
   background-color: #F5C48E;
}
</style>

</head>
<%
String id = (String)ActionContext.getContext().getSession().get("userid");
%>
<body>
   <div class="col-md-12 form">
   	<div class="col-md-1 home">
			<button class="h_btn" onclick="location.href='http://localhost:8080/responser2005/world/<%=id%>.jsp'" id="diary" target="_blank">
					<i class="material-icons">home</i>
			</button>
		</div>
      <div class="col-md-4"></div>
      <div class="col-md-4 tab-content">
         <h1>비밀번호 재확인</h1>
         <form action="modify_leave.action" method="post">
            <div class="field-wrap">
               <input type="text" value="${userid}" name="userid"
                  readonly="readonly" /> <input type="password" name="userpass"
                  required autocomplete="off" />
            </div>
         
            <p class="forgot" style="color: red">${errorMessage}</p>


            <button class="button button-block">확인</button>


         </form>


      </div>
      <!-- tab-content -->
      <div id="mySidenav" class="col-md-4 sidenav">
         <a class="btn" id="goback"
            href="http://localhost:8080/responser2005/world/${userid}.jsp">뒤로</a>
         <a class="btn" id="modify"
            href="/responser2005/info/setting/home_modify.jsp">변경</a> <a
            class="btn" id="projects" href="javascript:sessionout();">logout</a>
      </div>
   </div>
   <!-- /form -->

</body>

<s:if test="%{message.equals('수정완료')}">
   <script>
      var message = "수정이 완료되었습니다.";

      window.alert(message);
   </script>
</s:if>


<script type="text/javascript">
   function sessionout() {
      opener.location.href = "http://localhost:8080/responser2005/logout.action";
      window.close();
   }
</script>

<script
   src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>


<script type="text/javascript">
   $(".form").find("input, textarea").on("keyup blur focus", function(e) {
      var $this = $(this), label = $this.prev("label");

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

      $(this).parent().addClass("active");
      $(this).parent().siblings().removeClass("active");

      target = $(this).attr("href");

      $(".tab-content > div").not(target).hide();

      $(target).fadeIn(600);
   });
</script>
</html>