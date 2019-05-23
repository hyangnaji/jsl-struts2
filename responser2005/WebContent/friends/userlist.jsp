<%@page import="action.UserSearchAction"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="controller.InfoDAO"%>
<%@page import="model.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="controller.MemberDAO"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!-- userlist.css 추가 되었음, usersearchAction (struts action 추가) 추가, memberDAO list 추가 -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/responser2005/css/userlist.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>

<!-- userlist.css 추가 되었음, usersearchAction (struts action 추가) 추가, memberDAO list 추가 -->

 <div id="myIdOverlay" class="overlay">
      <span class="closebtn" onclick="closeIdSearch()" title="Close Overlay">×</span>
      <div class="overlay-content">
         <form action="idfind.action" method="post"
            onsubmit="return idcheck();" name="idfindFrm">
            <input type="text" placeholder="Search.." id="userid" name="userid">
            <button type="submit">
               <i class="fa fa-search"></i>
            </button>
         </form>
      </div>
   </div>
   <div id="myNameOverlay" class="overlay">
      <span class="closebtn" onclick="closeNameSearch()"
         title="Close Overlay">×</span>
      <div class="overlay-content">
         <form action="namefind.action" method="post"
            onsubmit="return namecheck();" name="namefindFrm">
            <input type="text" placeholder="Search.." id="name" name="name">
            <button type="submit">
               <i class="fa fa-search"></i>
            </button>
         </form>
      </div>
   </div>

<body>
<div class="w3-main w3-content w3-white w3-padding" style="max-width:1200px; margin-top:100px">
   <h2 align="center"><b>멤버 목록</b></h2>
	<br>
   <!-- 찾기 기능 추가 -->
   <div align="center">
   <button class='openBtn1' onclick="openIdSearch()"><b>아이디로 찾기</b></button>&nbsp;&nbsp;&nbsp;
   <button class="openBtn2" onclick="openNameSearch()"><b>이름으로 찾기</b></button>
	</div>
	<br>
	<hr>
   <!-- 리스트 -->
      <%    
	int pageNumber = 1;
   	MemberDAO dao = new MemberDAO();
	if(request.getParameter("pageNumber") != null){
   	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
	ArrayList<Member> list = dao.getList(pageNumber);   
   	int j = 0;
      if(list != null){
         Info info = null;
         InfoDAO i_dao = new InfoDAO();%>
         
         <div class="w3-row-padding w3-padding-16 w3-center">        
         
         <%for(int i = 0; i<list.size(); i++){
            info = i_dao.searchInfo(list.get(i));
   			if(i == 4)break;%>
      <!-- 2명씩 정렬할 때는 %3, 5명씩 정렬하기때문에 %6 해줘야 함 -->
   			
    		<div class="w3-quarter" onclick="window.open('http://localhost:8080/responser2005/world/<%=list.get(i).getUserid()%>.jsp','친구추가','width=1100px, height=650px');">
      			<img src="<%=info.getI_pic()%>" alt="<%=info.getI_id()%>" style="width:200px; height: 200px"/>
     			<h3><a href="#">
     			<%=list.get(i).getName()%></a></h3>
     			<h6><%=info.getI_name()%></h6>
     			<h6><%=info.getI_intro()%></h6>
    		</div>   
      <%   }//for문 절 %>
      </div>
      		<div class="w3-row-padding w3-padding-16 w3-center">
			<%for(int i = 4; i<list.size(); i++){ 
			info = i_dao.searchInfo(list.get(i));
			if(i==8)break;	%>
			
				<div class="w3-quarter" onclick="window.open('http://localhost:8080/responser2005/world/<%=list.get(i).getUserid()%>.jsp','친구추가','width=1100px, height=650px');">
      			<img src="<%=info.getI_pic()%>" alt="<%=info.getI_id()%>" style="width:200px; height: 200px"/>
     			<h3><a href="#">
     			<%=list.get(i).getName()%></a></h3>
     			<h6><%=info.getI_name()%></h6>
     			<h6><%=info.getI_intro()%></h6>
    		</div> 		
			
      <%} //for문 절%>
		
		</div>
		
			
      <%}else{%>
      <p>존재하는 회원이 없습니다.</p>
      <%} %>
  	 <div class="jaehee" style="clear:both; text-align:center">      
  <%
             if(pageNumber != 1){
          %>
            
          <a href="/responser2005/friends/userlist.jsp?pageNumber=<%=pageNumber - 1 %>"  class="btn btn-success btn-arraw-left"><i class="material-icons" >
            앞으로</i></a>
          <%      
          }  else{%>
          
            <a href="#"  class="btn btn-success btn-arraw-left"><i class="material-icons" >
            앞으로</i></a>
          <%} 
           for(int i=1;i<dao.numbermax()+1;i++){
          %>  
          
           <a href="/responser2005/friends/userlist.jsp?pageNumber=<%=i%>" class="btn btn-success btn-arraw-left">
          <b class="material-icons" >
         |<%=i%>|</b></a>
           <%}
            if(pageNumber < dao.numbermax()){
          %>
             <a href="/responser2005/friends/userlist.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left"><i class="material-icons">
            뒤로</i></a>
      

    <%
          }else{
          %>
           <a href="#" class="btn btn-success btn-arraw-left"><i class="material-icons">
            뒤로</i></a>
          <%} %>
          </div>
          
   </div>
</body>    
<script>
   function idcheck() {

      var id = document.idfindFrm.getElementById("userid");
      if (idfindFrm.userid.value == "") {
         alert("아이디를 입력해 주세요");
         idfindFrm.userid.focus();
         return false;
      }

      return true;

   }

   function namecheck() {
      if (namefindFrm.name.value == "") {
         alert("이름을 입력해 주세요");
         namefindFrm.name.focus();
         return false;
      }
      return containsChars(input, chars);
   }
   function openNameSearch() {
      document.getElementById("myNameOverlay").style.display = "block";
   }
   function openIdSearch() {
      document.getElementById("myIdOverlay").style.display = "block";
   }
   function closeNameSearch() {
      document.getElementById("myNameOverlay").style.display = "none";
   }
   function closeIdSearch() {
      document.getElementById("myIdOverlay").style.display = "none";
   }
   function check(re, what, message) {
      if (re.test(what.value)) {
         return true;
      }
      alert(message);
      what.value = "";
      what.focus();
      return false;
   }
</script>


</html>