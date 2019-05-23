<%@page import="java.util.ArrayList"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="model.Photo"%>
<%@page import="java.util.List"%>
<%@page import="controller.PhotoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@include file="/info/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- 테이블 info i_pic(100) -> i_pic(1000) 수정됨 -->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/responser2005/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>

* {
   box-sizing: border-box;
}
#home {
  width: 46px;
  height: 44px;
  background: url(img_navsprites.gif) 0 0;
}
body {
background-image: url("/responser2005/css/image/swlee.jpg"); 
   font-family: 'Roboto', sans-serif;
}

h1, .row {
   text-align: center;
}

.row figure {
   height: 240px;
   width: 240px;
   margin: 0;
   background-size: cover;
   background-position: 50% 50%;
   box-shadow: 0 0 15px rgba(0, 0, 0, 0.7);
   transition: all 1s ease-in-out;
   background-repeat: no-repeat;
   z-index: 2;
   display: inline-block;
   position: relative;
}

.row a {
   display: inline-block;
   text-align: center;
   margin: 40px;
   text-decoration: none;
color: red;
}

.row a p {
   position: absolute;
   opacity: 0;
   font-size: 20px;
   top: 45%;
   z-index: 100;
   left: 0;
   right: 0;
   margin: auto;
}

figure:hover p {
   opacity: 1;
}

figure:after {
   content: "";
   display: inline-block;
   height: 100%;
   width: 100%;
   background-color: #DA291C;
   position: absolute;
   left: 0;
   bottom: 0;
   opacity: 0;
   transition: all 0.4s ease-in-out 0s;
   z-index: 99;
}

figure:hover:after {
   opacity: 0.7;
}

/* lightbox */
.lightbox-target {
   position: fixed;
   top: -100%;
   width: 100%;
   background: rgba(0, 0, 0, 0.7);
   width: 100%;
   opacity: 0;
   -webkit-transition: opacity .5s ease-in-out;
   -moz-transition: opacity .5s ease-in-out;
   -o-transition: opacity .5s ease-in-out;
   transition: opacity .5s ease-in-out;
   overflow: hidden;
   z-index: 300;
}

.lightbox-target .container {
   margin: auto;
   position: absolute;
   top: 50vh;
   left: 50vw;
   background-color: white;
   box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
   -webkit-transition: .5s ease-in-out;
   -moz-transition: .5s ease-in-out;
   -o-transition: .5s ease-in-out;
   transition: .5s ease-in-out;
   text-align: left;
   transform: translate3d(-50%, -50%, 0);
}

h3 {
   text-align: center;
}

.container .elements {
   display: inline-block;
   width: 40%;
   max-height: 425px;
}



a.lightbox-close {
   display: block;
   width: 50px;
   height: 50px;
   background: none;
   color: black;
   text-decoration: none;
   position: absolute;
   top: 0px;
   right: 0;
   margin: 0;
   padding-top: 10px;
}

.lightbox-target:target {
   opacity: 1;
   top: 0;
   bottom: 0;
}

.lightbox-target:target img {
   height: 400px;
   vertical-align: top;
} 
.center{
margine:0;
boreder:0;
}
button{
   background: #FBCBBF;
   color: #FFFFFF;
}
button {
  background-color: #FBCBBF;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}


a:hover {
   color: black;
}

input,
 textarea {
  display: block;
  width: 100%;
  border: none;
  border-bottom: 1px solid #757575;
  left: 25px;
  padding: 5px;
  font-family: Trebuchet MS;
  background: none;
  color: #ccc;
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
   .prev, .next, .text {
      font-size: 11px
   }
}
</style>
<%
String id = (String) ActionContext.getContext().getSession().get("userid");

String memberid = (String) ActionContext.getContext().getSession().get("memberid");
%>
</head>
<body>
   <%     
   List<Photo> p_list = (ArrayList<Photo>) request.getAttribute("p_list");
      request.setAttribute("p_list", p_list);
   %>
   <%      
      PhotoDAO dao = new PhotoDAO();
          if (p_list == null) {
 	 p_list = dao.phtoList(memberid);
      } 
   %>

<div class="center" style="clear:both;">
<h1>사진첩</h1>
</div>

<%if(memberid.equals(id)){ %>

<a href="/responser2005/info/photo/photoinsert.jsp" style="clear:both; text-decoration:none;">사진저장</a>
   <div class="row">
<%    
int pageNumber = 1;

if(request.getParameter("pageNumber") != null){
   pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
ArrayList<Photo> list = dao.getList(pageNumber,memberid);   
if(list!=null){
for(int i=0; i<list.size();i++) {
      
   %>         
   
      <a class="lightbox" href="#photo<%=i%>"> 
      
      <figure class="photo<%=i%>">
      <img src="/responser2005/img/<%=list.get(i).getP_addr()%>" class="hover-shadow cursor" style="width:100%; height:100%">
         <p><%=list.get(i).getP_subject()%></p>
      </figure>
      </a>
      <div class="lightbox-target" id="photo<%=i%>">
         <div class="container">
            <form action="photoview.action" method="post">
            
               <img src="/responser2005/img/<%=list.get(i).getP_addr()%>" class="hover-shadow cursor">
               <br>
               <p>제목</p> <input type="text" name="p_subject"
                  value="<%=p_list.get(i).getP_subject()%>" readonly />
               <p>내용</p><textarea type="text" placeholder="멋대로 써보세요" name="p_content" 
               value="<%=list.get(i).getP_content()%>" required ><%=list.get(i).getP_content()%></textarea>
                   <br>
                  <input
                  type="hidden" name="p_num" value="<%=list.get(i).getP_num()%>"
                  readonly /> <input type="hidden" name="p_id"
                  value="<%=p_list.get(i).getP_id()%>" readonly /> 
                  <input type="hidden" name="p_addr" value="<%=list.get(i).getP_addr()%>"/>
                  <%if(id.equals(memberid)){ %>
                  <button type="submit" formaction="photo_profile.action?userid=<%=id%>">프로필설정</button>
               <button type="submit" class="btn btn-primary">변경</button>
               <button type="submit"  formaction="photodelete.action">삭제</button><%} %>
            </form>
            <a class="lightbox-close" href="#" style="text-decoration:none; bgcolor:none;">X</a>
         </div>
      </div>
   
      <%      
}   // end of for
   %>
   <br>
           <%
             if(pageNumber != 1){
          %>
            
          <a href="/responser2005/info/photo/photoview.jsp?pageNumber=<%=pageNumber - 1 %>"  class="btn btn-success btn-arraw-left"><i class="material-icons" >
            앞으로</i></a>
          
          <%for(int i=1;i<dao.numbermax(memberid)+1;i++){
          %>  
          
           <a href="/responser2005/info/photo/photoview.jsp?pageNumber=<%=i%>" class="btn btn-success btn-arraw-left">|<%=i%>|</a>
           <%}
            if(pageNumber < dao.numbermax(memberid)){
          %>
             <a href="/responser2005/info/photo/photoview.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left"><i class="material-icons">
            뒤로</i></a>
  <%}
}
}else{%>
	<p>아무것도 없다요</p>
	
<%}

}else{ %>  
   <div class="row">
<%    
int pageNumber = 1;

if(request.getParameter("pageNumber") != null){
   pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
ArrayList<Photo> list = dao.getList(pageNumber, memberid);   
if(list!=null){
for(int i=0; i<list.size();i++) {
   %>         
   
      <a class="lightbox" href="#photo<%=i%>"> 
      
      <figure class="photo<%=i%>">
      <img src="/responser2005/img/<%=list.get(i).getP_addr()%>" class="hover-shadow cursor" style="width:100%; height:100%">
         <p><%=list.get(i).getP_subject()%></p>
      </figure>
      </a>
      <div class="lightbox-target" id="photo<%=i%>">
         <div class="container">
            <form action="photoview.action" method="post">
            
               <img src="/responser2005/img/<%=list.get(i).getP_addr()%>" class="hover-shadow cursor">
               <br>
               <p>제목</p> <input type="text" name="p_subject"
                  value="<%=p_list.get(i).getP_subject()%>" readonly />
               <p>내용</p><textarea type="text" placeholder="멋대로 써보세요" name="p_content" 
               value="<%=list.get(i).getP_content()%>" required ><%=list.get(i).getP_content()%></textarea>
                   <br>
                  <input
                  type="hidden" name="p_num" value="<%=list.get(i).getP_num()%>"
                  readonly /> <input type="hidden" name="p_id"
                  value="<%=p_list.get(i).getP_id()%>" readonly /> 
                  <input type="hidden" name="p_addr" value="<%=list.get(i).getP_addr()%>"/>
            </form>
            <a class="lightbox-close" href="#" style="text-decoration:none; bgcolor:none;">X</a>
         </div>
      </div>
   
      <%      
}   // end of for
   %>
   <br>
           <%
             if(pageNumber != 1){
          %>
            
          <a href="/responser2005/info/photo/photoview.jsp?pageNumber=<%=pageNumber - 1 %>"  class="btn btn-success btn-arraw-left"><i class="material-icons" >
            앞으로</i></a>
          <% 
           for(int i=1;i<dao.numbermax(memberid)+1;i++){
          %>  
          
           <a href="/responser2005/info/photo/photoview.jsp?pageNumber=<%=i%>" class="btn btn-success btn-arraw-left">|<%=i%>|</a>
           <%}
            if(pageNumber < dao.numbermax(memberid)){
          %>
             <a href="/responser2005/info/photo/photoview.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left"><i class="material-icons">
            뒤로</i></a>


	    <% }
       }
      }else{%>
    	<p>아무것도 없다요</p>  
      <%}
    	  
     }%>
          

</body>
</html>