<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="model.Music" %>   
<%@ page import="java.util.Map" %>   
<%@ page import="controller.MusicDAO" %>   
<%@ page import="java.util.ArrayList" %>   
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/responser2005/css/musiclist.css">
   <link rel="stylesheet" href="/responser2005/css/normalize.css">    
   <link rel="stylesheet" href="/responser2005/css/normalize_style.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
   </head>
   
   <div id="myIdOverlay" class="overlay">
         <span class="closebtn" onclick="closeIdSearch()" title="Close Overlay">×</span>
         <div class="overlay-content">
            <form action="musicnamesearch.action" method="post"   onsubmit="return idcheck();" name="idfindFrm">
               <input type="text" placeholder="Search.." id="userid" name="musicname">
               <button type="submit">   <i class="fa fa-search"></i> </button>
            </form>
         </div>
      </div>
      <div id="myNameOverlay" class="overlay">
         <span class="closebtn" onclick="closeNameSearch()" title="Close Overlay">×</span>         
         <div class="overlay-content">
            <form action="musicartistsearch.action" method="post" onsubmit="return namecheck();" name="namefindFrm">
               <input type="text" placeholder="Search.." id="name" name="musicartist">
               <button type="submit">   <i class="fa fa-search"></i>   </button>
            </form>
         </div>
</div>
<body>



<!-- struts.xml, MusicSearch.java, MusicDAO 손봄 -->

<%      
   String userID = null;
   if(ActionContext.getContext().getSession().get("userid") != null){
      userID = (String)ActionContext.getContext().getSession().get("userid");
   }
   int pageNumber = 1;
   if(request.getParameter("pageNumber") != null){
      pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
   }
   
  
%>

<nav class="navbar navbar-default">
      <div class="naver-header">
         <!-- 헤더로 들어갈 부분 -->
      </div>      

      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
         </ul>
         <!-- 접속하기는 로그인안한 사람만 보여주게하기 -->
         <%
            if(userID == null){
         %>   
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                  <ul class="dropdown-menu">                  
                  <li><a href="/responser2005/member/register_login.jsp">로그인/회원가입</a></li>
               </ul>
            </li>      
         </ul>
          <% 
            }else{
          %>         
            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                     <ul class="dropdown-menu">
                     <li style = " color : white" >${username}(${userid})님</a>
                     <li><a href="/responser2005/world/index_success.jsp">내홈피</a>
                     <li><a href="logout.action">로그아웃</a></li>
<!-- 오른쪽으로 -->     <li style="right: 0;"><a href="musicdelete.action?userid=<%=(String)ActionContext.getContext().getSession().get("userid")%>">음악해지</a></li>
                     <li style="color: red">${errorMessage}</li>
                  </ul>
               </li>   
            </ul> 
          <%   
            }
             %>
      </div>
   </nav>   
  </head>

     <div class="form">
     
        <h3>음악 찾기</h3>
       <button class="openBtn" onclick="openIdSearch()">곡명으로 찾기</button>
      <button class="openBtn" onclick="openNameSearch()">가수로 찾기</button>
      <button class="openBtn" onclick="location.href='http://localhost:8080/responser2005/member/musiclist.jsp'">전체 보기</button>
       <div class="row">
       <h3>음악 목록</h3>
       <input type="hidden" value="${userid}" name ="userid"/>
             <table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
             <thead>
               <tr class="header">
                  <th style="background-color:#eeeeee; text-align: center;">번호</th>
                  <th style="background-color:#eeeeee; text-align: center;">곡명</th>
                  <th style="background-color:#eeeeee; text-align: center;">아티스트</th>
                  <th style="background-color:#eeeeee; text-align: center;">담기</th>
               </tr>             
             </thead>
             <tbody>
             <%if((List<Music>)request.getAttribute("list") != null){
                List<Music> Musiclist = (List<Music>)request.getAttribute("list");
                for(int i=0; i < Musiclist.size(); i++){
       %>
              <tr>
                <td style = "text-align : center;"><%= i+1%></td>
                <td style = "padding : 10px;"><%= Musiclist.get(i).getMusicname()%></td>
                <td style = "padding : 10px;"><%= Musiclist.get(i).getMusicartist() %></td>
            <%
               if(userID != null){
            %>                
                <td style = "text-align : center;"><button onclick="location.href = 'cart_music.action?musiccode=<%=Musiclist.get(i).getMusiccode()%>&userid=<%=userID%>'">
                <i class="material-icons">star</i></button></td>
             <%
               }else{
            %>
               <td style = "text-align : center;"><button onclick= "return member_cart(<%=userID%>)"><i class="material-icons">star</i></button></td>
            <%      
               }
            }
             %>
             </tr>
             
             </tbody>
             
             
          <% 
             }
             
             
             if((List<Music>)request.getAttribute("list") == null){
             %>
             
             <tbody>
             
             <% 
                MusicDAO dao = new MusicDAO();
                ArrayList<Music> list = dao.getList(pageNumber);               
                for(int i=0; i < list.size(); i++){
             %>
            
             <tr>
                <td style = "text-align : center;"><%= i+1%></td>
                <td style = "padding : 10px;"><%= list.get(i).getMusicname()%></td>
                <td style = "padding : 10px;"><%= list.get(i).getMusicartist() %></td>
            <%
               if(userID != null){
            %>                
                <td style = "text-align : center;"><button onclick="location.href = 'cart_music.action?musiccode=<%=list.get(i).getMusiccode()%>&userid=<%=userID%>'">
                <i class="material-icons">star</i></button></td>
             <%
               }else{
            %>
               <td style = "text-align : center;"><button onclick= "return member_cart(<%=userID%>)"><i class="material-icons">star</i></button></td>
            <%      
               }
             %>
             </tr>             
            <%      
                }
             %>
             </tbody>
          </table>      
          
          <%
             if(pageNumber != 1){
          %>
            
            <p style = "text-align: center;"><a href="http://localhost:8080/responser2005/member/musiclist.jsp?pageNumber=<%=pageNumber - 1 %>"  class="btn btn-success btn-arraw-left"><i class="material-icons" >
            first_page</i></a></p>
          <%      
          }
          
             if(pageNumber < dao.numbermax(pageNumber)){
            %>
               <p style = "text-align: center;">
               <a href="http://localhost:8080/responser2005/member/musiclist.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">
               <i class="material-icons">last_page</i></a></p>
            
            <%}
             }
            %>
            
          
       </div>
   </div>
   
   <s:if test="%{Message == '성공'}">
   <script>
   window.alert("음악 설정이 해제되었습니다.");        
   </script>
</s:if>   
   <s:if test="%{Message == '같음'}">
   <script>
   window.alert("등록된 음악이 없습니다.");        
   </script>
</s:if>   
 <s:if test="%{Message == '실패'}">
   <script>
   window.alert("실패했습니다");        
   </script>
</s:if>   
   
   
<script>
   function member_cart(e){
      if(e == null){
         window.alert("로그인 후 이용가능합니다.");      
         return false;
      }               
   }
</script>

<script>
      function idcheck() {

         var id = document.idfindFrm.getElementById("userid");
         if (idfindFrm.userid.value == "") {
            alert("곡명을 입력해 주세요");
            idfindFrm.userid.focus();
            return false;
         }

         return true;

      }

      function namecheck() {
         if (namefindFrm.name.value == "") {
            alert("가수명을 입력해 주세요");
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>   
<script src="js/bootstrap.min.js"></script> 

</body>
</html>
</html>