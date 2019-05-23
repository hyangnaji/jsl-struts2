<%@page import="model.Photo"%>
<%@page import="controller.PhotoDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="/info/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
   if(ext != 'jpg' && ext != 'jpeg') {
   alert('jpg or jpeg의 확장자만 가능합니다');
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
   Calendar cal = Calendar.getInstance();
   String strYear = request.getParameter("year");
   String strMonth = request.getParameter("month");
   int year = cal.get(Calendar.YEAR);
   int month = cal.get(Calendar.MONTH);
   int date = cal.get(Calendar.DATE);
   if (strYear != null)
   {
      year = Integer.parseInt(strYear);
      month = Integer.parseInt(strMonth);
   } 
   //년도/월 셋팅
   cal.set(year, month, 1);
   int startDay = cal.getMinimum(java.util.Calendar.DATE);
   int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
   int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
   int newLine = 0;

   //오늘 날짜 저장.
   Calendar todayCal = Calendar.getInstance();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
   int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<head>
   <link href="/responser2005/css/photoinsert.css" rel="stylesheet" type="text/css">
   <link href="/responser2005/css/diary_text_style.css" rel="stylesheet" type="text/css">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/responser2005/css/main.css">
    <link href="/responser2005/css/photoinsert.css" rel="stylesheet" type="text/css">
   <title>사진첩</title>
</head>

<%
Photo photo=null; 
photo=(Photo)request.getAttribute("photo");
String id = (String)ActionContext.getContext().getSession().get("userid");
%>

<body>
<div class="col-md-12 board">
   
      
<%if((String)ActionContext.getContext().getSession().get("memberid") != (String)ActionContext.getContext().getSession().get("userid")) {%>
<div class="underline">
   <h3>사진첩</h3>
      <p>
         <font color="red">*</font> 는 필수 입력입니다.
      </p>
      </div>
   <div class="insert_form">
      <s:if test="%{photo==null}">
      <form action="photoinsert.action" method="post" name="nhForm"
         enctype="multipart/form-data">
         <s:hidden name="p_id" value="%{#session.userid}"></s:hidden>
         <div class="inputGroup">      
               <p>날짜&nbsp;<font color="red">*</font></p>
             <input type="text" placeholder="please input kind" name="p_day" value="<%=intToday %>" readonly /> 
               <span class="inputBar"></span>
        </div>
        <div class="inputGroup">      
             <input type="text" name="p_subject" required /> 
               <span class="inputBar"></span>
             <label>제목&nbsp;<font color="red">*</font></label>
        </div>
        <div class="inputGroup"> 
              <p>내용&nbsp;<font color="red">*</font></p>     
             <textarea type="text" placeholder="멋대로 써보세요" name="p_content"  required ></textarea>
               <span class="inputBar"></span>
        </div>
        <div class="inputGroup">      
               <p>이미지 불러오기&nbsp;<font color="red">*</font></p>
             <input type="file" id="upload" name="upload" label="File" size="50" accept=".jpg, .gif" onchange='getCmaFileView()'/><br>
               <span class="inputBar"></span>
               <input type="reset" value="취소" />   <input type="submit" value="저장" />
        </div>
            
      </form>
      </s:if>
      <s:else>
      <form action="photomodify.action" method="post" name="nhForm" enctype="multipart/form-data">
         <s:hidden name="p_id" value="%{#session.userid}"></s:hidden>
         <div class="inputGroup">      
               <p>날짜&nbsp;<font color="red">*</font></p>
             <input type="text" placeholder="date" name="p_day" value="<%=photo.getP_day() %>" readonly />  
               <span class="inputBar"></span>
         </div>
         <div class="inputGroup">      
             <input type="text" name="p_subject"  value="<%=photo.getP_subject() %>" required /> 
               <span class="inputBar"></span>
             <label>제목&nbsp;<font color="red">*</font></label>
         </div>
        <div class="inputGroup"> 
              <p>내용&nbsp;<font color="red">*</font></p>     
             <textarea type="text" placeholder="멋대로 써보세요" name="p_content"  required ><%=photo.getP_content() %></textarea>
               <span class="inputBar"></span>
        </div>
        <input type="hidden" name="oldp_num" value="<%=photo.getP_num() %>"/>
        <div class="inputGroup">      
               <p>이미지 불러오기&nbsp;<font color="red">*</font></p>
              <input type="file" id="upload" name="upload" label="File" size="50" accept=".jpg, .gif" onchange='getCmaFileView()'/><br>
               <span class="inputBar"></span>
                 <label for="upload"><b>Image</b></label> 
            <input type="reset" value="취소" />    <input type="submit" value="수정" />  
        </div>
          
      </form>
      </s:else>
   </div>
   <%} %>
</div>
</body>
</html>