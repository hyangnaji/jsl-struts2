<%@page import="model.Diary"%>
<%@page import="controller.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/info/header.jsp" %>	
<html>
<head>

<script type="text/javascript">

function captureReturnKey(e) {
    if(e.keyCode==13 && e.srcElement.type != 'textarea')
    return false;
}

	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
	function check() {
		alert("정말로 삭제하시겠습니까?");
		return true;
	}
	function check() {
		var text = document.querySelector('textarea');
		var result = text.value.replace(/(\n|\r\n)/g, '<br>');

		console.log(result);
		}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/responser2005/css/main.css">
<link rel="stylesheet" href="/responser2005/css/diary_text_style.css">
<title>다이어리</title>
</head>

<%
String id=(String)session.getAttribute("userid");
	String date = request.getParameter("date");
	DiaryDAO dao = new DiaryDAO();
	
	Diary diary = dao.dateDiary(id, date);
	request.setAttribute("diary", diary);

%>

<body>
	<%if((String)ActionContext.getContext().getSession().get("memberid") != (String)ActionContext.getContext().getSession().get("userid")) {%>
	<div class="col-md-12 board">
       <div class="col-md-2 underline">
		<font size="3" color="red">${error_msg}</font>
		<h3>일기쓰기</h3>
	</div>
	<% if (diary==null) {	
	%>
	<div class="col-md-10 insert_form">
		<form action="diaryinsert.action" method="post">
			<div class="col-md-12 inputGroup">
				<p>날짜</p>
				<input type="text" name="date" value="<%=date%> " readonly required /> 
	   			<span class="inputBar"></span>
	  		</div> <br>
          	 <div class="col-md-12 inputGroup">      
	    		<input type="text" id="subject" name="subject" required/>
	   			<span class="inputBar"></span>
	    		<label>제목</label>
	  		</div>
	  		<div class="col-md-12 inputGroup">      
	    		<textarea id="content" name="content" placeholder="멋대로 써보세요" ></textarea>
	   			<span class="inputBar"></span>
	    		<label>내용</label>
	  		</div>
	  		
	        <input type="reset"value="취소" />	<input type="submit" value="등록" />
		</form>
	</div>	
	<%} else{%>
			<div class="insert_form">
         <form action="diarymodify.action" method="post">
	         <div class="inputGroup">      
	         	<p>날짜</p>
	    		 <input type="text" name="date" value="<%=date%> " readonly /> 
	   			<span class="inputBar"></span>
	  		</div>
	        <div class="inputGroup">      
	    		<input type="text" id="subject" name="subject" value="${diary.subject}" required/>
	   			<span class="inputBar"></span>
	    		<label>제목</label>
	  		</div>
	  		<div class="inputGroup">      
	    		<textarea id="content" name="content" d> ${diary.content} </textarea>
	   			<span class="inputBar"></span>
	    		<label>내용</label>
	  		</div>

         	<input type="reset" value="취소" />	<input type="submit" value="수정" />
        	<input type="button" onclick="location.href='diarydelete.action?date=<%=date %>'" value="삭제"/>
      	</form>
      </div>
      <%}
	} %>
   </div>   
</body>
</html>