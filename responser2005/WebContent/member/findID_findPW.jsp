<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/background.jsp" %>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Find ID & PW</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/responser2005/css/normalize.css">    
    <link rel="stylesheet" href="/responser2005/css/normalize_style.css">
  </head>

  <body>
  <%
  String memberhome = request.getServletPath().toString();	
  String[] array = memberhome.split("/");
  
  String cut = array[2];   %>
  
  
  
  <%if(cut.equals("findID.action")){ %>
    <div class="form">     
    <div class="goback">
			<button onclick="histroy.go(-1);"><i class="material-icons">keyboard_backspace</i></button>
		</div> 
      <ul class="tab-group">
        <li class="tab active" ><a href="#findid">아이디</a></li>
        <li class="tab"><a href="#findpw">비밀번호</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="findid">   
          <h1>아이디찾기</h1>
          
          <form action="findID.action" method="post">
           <div class="field-wrap">
            <label>
              이름<span class="req">*</span>
            </label>
            <input type="text" name = "username" value = "${username}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              이메일<span class="req">*</span>
            </label>
            <input type="email" name = "useremail" value = "${useremail}" required autocomplete="off"/>
          </div>          
          
            <div class="field-wrap">
              <label>
               	전화번호<span class="req">*(01012345678)</span>
              </label>
               <input type="tel" pattern="(010)\d{8}" name ="phone" value = "${phone}" required autocomplete="off" />
            </div>     
            <p><br></p>  
        	<p class="forgot" style="color: red">${error_message}</p>
        	<p class="forgot"><a href="/responser2005/member/register_login.jsp">로그인하기</a></p>
        
          <button class="button button-block">찾기</button>
          </form>
        </div>
        
        
        <div id="findpw">           
          <h1>비밀번호찾기</h1>          
          <form action="findPW.action" method="post">          
            <div class="field-wrap">
            <label>아이디<span class="req"></span></label>
            <input type="text" name = "userid" maxlength="10" value = "${userid}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>이름<span class="req">*</span></label>
            <input type="text" name = "username" value = "${username}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap"><label>이메일<span class="req">*</span>
            </label>
            <input type="email" name = "useremail"  value = "${useremail}"  required autocomplete="off"/>
          </div>          
          
            <div class="field-wrap">
              <label>전화번호<span class="req">*(01012345678)</span></label>
               <input type="tel" pattern="(010)\d{8}" name ="phone" value = "${phone}" required autocomplete="off" />
            </div>                  
          <p><br></p>
          <p class="forgot" style="color: red">${error_message}</p>
           <p class="forgot"><a href="/responser2005/member/register_login.jsp">로그인하기</a></p>
          
          <button class="button button-block">찾기</button>
 
          </form>
        </div>
      </div><!-- tab-content -->      
	</div> <!-- /form -->
<%}else{ %>
	<div class="form">      
	<div class="goback">
			<button onclick="histroy.go(-1);"><i class="material-icons">keyboard_backspace</i></button>
		</div>
      <ul class="tab-group">
        <li class="tab" ><a href="#findid">아이디</a></li>
        <li class="tab active"><a href="#findpw">비밀번호</a></li>
      </ul>
      
      <div class="tab-content">                
        <div id="findpw">           
          <h1>비밀번호찾기</h1>          
          <form action="findPW.action" method="post">          
            <div class="field-wrap">
            <label>아이디<span class="req"></span></label>
            <input type="text" name = "userid" maxlength="10" value = "${userid}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>이름<span class="req">*</span></label>
            <input type="text" name = "username" value = "${username}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap"><label>이메일<span class="req">*</span>
            </label>
            <input type="email" name = "useremail"  value = "${useremail}"  required autocomplete="off"/>
          </div>          
          
            <div class="field-wrap">
              <label>전화번호(01012345678)<span class="req">*</span></label>
               <input type="tel" pattern="(010)\d{8}" name ="phone" value = "${phone}" required autocomplete="off" />
            </div>                  
          <p><br></p>
          <p class="forgot" style="color: red">${error_message}</p>
           <p class="forgot"><a href="/responser2005/member/register_login.jsp">로그인하기</a></p>
          
          <button class="button button-block">찾기</button>
 
          </form>
        </div>
        
        <div id="findid">   
          <h1>아이디찾기</h1>
          
          <form action="findID.action" method="post">
           <div class="field-wrap">
            <label>
              이름<span class="req">*</span>
            </label>
            <input type="text" name = "username" value = "${username}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              이메일<span class="req">*</span>
            </label>
            <input type="email" name = "useremail" value = "${useremail}" required autocomplete="off"/>
          </div>          
          
            <div class="field-wrap">
              <label>
               	전화번호(01012345678)<span class="req">*</span>
              </label>
               <input type="tel" pattern="(010)\d{8}" name ="phone" value = "${phone}" required autocomplete="off" />
            </div>     
            <p><br></p>  
        	<p class="forgot" style="color: red">${error_message}</p>
        	<p class="forgot"><a href="/responser2005/member/register_login.jsp">로그인하기</a></p>
        
          <button class="button button-block">찾기</button>
          </form>
        </div>
        
      </div><!-- tab-content -->      
	</div> <!-- /form -->

<%} %>


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
	

  </body>
</html>