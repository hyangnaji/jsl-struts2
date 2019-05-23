<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/background.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Login & Register</title>
    <!-- <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'> -->
    <link href="https://fonts.googleapis.com/css?family=Gothic+A1:500|Sawarabi+Gothic" rel="stylesheet" type='text/css'>
    <link rel="stylesheet" href="/responser2005/css/normalize.css">    
    <link rel="stylesheet" href="/responser2005/css/normalize_style.css">
  </head> 
 <%
 String memberhome = request.getServletPath().toString();	
 String[] array = memberhome.split("/");
 
 String cut = array[2]; 		
 %>
  <body>
      <%if(cut.equals("login.action") || cut.equals("register_login.jsp")){ %>
       <div class="form">
      	 <ul class="tab-group">
        <li class="tab active" ><a href="#login">로그인</a></li>
        <li class="tab"><a href="#signup">회원가입</a></li>
        </ul>
        
         <div class="tab-content">
      	
      	<div id="login"> 
          
          <h1>어서오세요</h1>
          
          <form action="login.action" method="post">
          
            <div class="field-wrap">
            <label>
              아이디<span class="req"></span>
            </label>
            <input type="text" name = "userid" maxlength="10" value="${userid}" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              	비밀번호<span class="req"></span>
            </label>
            <input type="password" name = "userpass" value="${userpass}" maxlength="15" required autocomplete="off"/>
          </div>
          
          <p><br></p>
          <p class="forgot" style="color: res">${errorMessage}</p>
          <p class="forgot"><a href="/responser2005/member/findID_findPW.jsp">아이디/비밀번호찾기</a></p>
          
          <button class="button button-block">로그인</button>
          
          </form>

        </div>
      
        <div id="signup" > 
          <h1>회원가입</h1>
          <form action="join.action" method="post">
          	
           <div class="field-wrap">
            <label>
              	아이디<span class="req">*(4자 이상 10자 이하로 작성해주세요.)</span>
            </label>
            <input type="text" name="userid" pattern=".{4,}" maxlength="10" value = "${userid}" required autocomplete="off" style='ime-mode:disabled'/>
          </div>
          
           <div class="field-wrap">
            <label>
              비밀번호<span class="req">*최소 6자 최대 12자</span>
            </label>
            <input type="password" pattern=".{6,}" name = "userpass" maxlength="12" value = "${userpass}" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              비밀번호확인<span class="req">*</span>
            </label>
            <input type="password" name = "re_pass" value = "${re_pass}" maxlength="12" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              이름<span class="req">*</span>
            </label>
            <input type="text" name = "username" value = "${username}" maxlength="10" required autocomplete="off"/>
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
        	<p class="forgot" style="color: red">${errorMessage}</p>
        
          <button type="submit" class="button button-block">가입</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->   
   
</div> <!-- /form -->
      
        
        <%}else{ %>
          <div class="form">
      	 <ul class="tab-group">
        <li class="tab" ><a href="#login">로그인</a></li>
        <li class="tab active"><a href="#signup">회원가입</a></li>
      </ul>
      <div class="tab-content">
      
        <div id="signup" > 
          <h1>회원가입</h1>
          <form action="join.action" method="post">
          	
           <div class="field-wrap">
            <label>
              	아이디<span class="req">*(4자 이상 10자 이하로 작성해주세요.)</span>
            </label>
            <input type="text" name="userid" pattern=".{4,}" maxlength="10" value = "${userid}" required autocomplete="off" style='ime-mode:disabled'/>
          </div>
          
           <div class="field-wrap">
            <label>
              비밀번호<span class="req">*최소 6자 최대 12자</span>
            </label>
            <input type="password" pattern=".{6,}" name = "userpass" maxlength="12" value = "${userpass}" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              비밀번호확인<span class="req">*</span>
            </label>
            <input type="password" name = "re_pass" value = "${re_pass}" maxlength="12" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              이름<span class="req">*</span>
            </label>
            <input type="text" name = "username" value = "${username}" maxlength="10" required autocomplete="off"/>
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
        	<p class="forgot" style="color: red">${errorMessage}</p>
        
          <button type="submit" class="button button-block">가입</button>
          
          </form>

        </div>
        
        	<div id="login"> 
          
          <h1>어서오세요</h1>
          
          <form action="login.action" method="post">
          
            <div class="field-wrap">
            <label>
              아이디<span class="req"></span>
            </label>
            <input type="text" name = "userid" maxlength="10" value="${userid}" required autocomplete="off" style='ime-mode:disabled'/>
          </div>
          
          <div class="field-wrap">
            <label>
              	비밀번호<span class="req"></span>
            </label>
            <input type="password" name = "userpass" value="${userpass}" required autocomplete="off"/>
          </div>
          
          <p><br></p>
          <p class="forgot" style="color: res">${errorMessage}</p>
          <p class="forgot"><a href="/responser2005/member/findID_findPW.jsp">아이디/비밀번호찾기</a></p>
          
          <button class="button button-block">로그인</button>
          
          </form>

        </div>
      </div>
     </div>
<%} %>        
   

<s:if test="%{message.equals('가입완료')}">
  		<script>
  			var message = "가입이 완료되었습니다. 로그인해주세요.";
  			
  			window.alert(message);
  		</script>  		
 </s:if>
  	
 <s:if test="%{message.equals('아웃완료')}">
  		<script>
  			window.alert("세션이 만료되었습니다.");  		
  		</script>
 </s:if>
 
 <s:if test="%{message.equals('탈퇴완료')}">
  		<script>
  			window.alert("탈퇴가 완료되었습니다.");  		
  		</script>
 </s:if>

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