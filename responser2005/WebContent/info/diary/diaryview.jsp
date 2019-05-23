<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.List"%>
<%@page import="model.Diary"%>
<%@page import="controller.DiaryDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String memberid = (String)ActionContext.getContext().getSession().get("memberid");%>
<%
	String id= (String)ActionContext.getContext().getSession().get("userid");
	DiaryDAO dao = new DiaryDAO();	
	List<Diary>list = dao.totalDiary(id);	
%>
<%@include file="/info/header.jsp" %>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	if (strYear != null){
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/responser2005/css/main.css">
<link rel="stylesheet" type="text/css" href="/responser2005/css/calendar_style.css">
<!-- <link rel="stylesheet" type="text/css"  href="/responser2005/css/calendar.css"> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>



<div class="col-md-12 board">
<%
if(id.equals(memberid)){
%>	
	 		<!-- Calender start  -->
        
        <div class="col-md-3 calen">
         <!-- 4 nav -->
         <div class="col-md-12 sections" >
            <ul>
               <li class="notes">
               	<div class="button-1">
               	<div class="eff-1">
                  <a onclick="myFunction()" href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year - 1%>&amp;month=<%=month%>"   target="_self"> 이전해 </a>
               	</div>
               	</div>
               </li>
               <li class="notes">
               <div class="aftyear">
               <div class="aftyearon">
                  <a href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year + 1%>&amp;month=<%=month%>" target="_self"> 다음해   </a> 
               </div>
               </div>
               </li>
               <li class="calendar active">
               <div class="tod">
               <div class="todon">
                  <a href="javascript:location.href='<s:url value='/info/diary/diaryview.jsp'/>'" value="오늘">오늘</a>
               </div>
               </div>
               </li>
               <li class="settings">
               <div class="set">
                  <a href="/responser2005/info/diary/diaryinsert.jsp?date=<%=intToday%>">글쓰기</a>
               </div>
               </li>
            </ul>
         </div>
	
			<!-- 달력 헤더 좌우 변경 : 현재 월단위 -->
			<section class="month" id="january"/>
			<header> <!-- 월 단위 변경 -->
				<%
					if (month > 0) {
				%>
					<a href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year%>&amp;month=<%=month - 1%>" target="_self"><b>&lt;</b></a>
				<%
			 	} %>
			 		<b> &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월 &nbsp;&nbsp;</b>
				<%
					if (month < 11) {
				%>
					<a href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year%>&amp;month=<%=month + 1%>" target="_self"><b>&gt;</b></a> 
				<%
			 	} 
			 	%>
				<nav role='padigation'> <span></span> <span></span> </nav> 
			</header>
			
			<!-- 달력 부분 -->
			<article>
			<div class="col-md-12 days">
				<b>SU</b> <b>MO</b> <b>TU</b> <b>WE</b> <b>TH</b> <b>FR</b> <b>SA</b>
			</div>
			<div class="dates">
				<%
					for (int index = 1; index < start; index++) {
						out.println("<span>&nbsp;</span>");
						newLine++;
					}
					for (int index = 1; index <= endDay; index++) {
						String color = "";
						if (newLine == 0) {
							color = "RED";
						} else if (newLine == 6) {
							color = "#529dbc";
						} else {
							color = "BLACK";
						}
						
						String sUseDate = Integer.toString(year);
						sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
								: Integer.toString(month + 1);
						sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
								: Integer.toString(index);
						int iUseDate = Integer.parseInt(sUseDate);
						
						String backColor = "#EFEFEF";
						if (iUseDate == intToday) {
							backColor = "#c9c9c9";
						}
						out.println("<span bgcolor='");
		
						out.println( backColor ); 
			
						out.println("' nowrap>");
					
						out.println("<a href='/responser2005/info/diary/diaryinsert.jsp?date=" + iUseDate +"'>");
				%>
				<font color='<%=color%>'> <%=index%>
				</font>
				<%
						out.println("</a></span>"); 
		
						newLine++;
						if (newLine == 7) {
							out.println("<br>");
							if (index <= endDay) {
								out.println("</span>");
							}
							newLine = 0;
						}
					}
					//마지막 공란 LOOP
					while (newLine > 0 && newLine < 7) {
						out.println("<span>&nbsp;</span>");
						newLine++;
					}
				%>
			</div>
			</article> 
			</section>
			</div>
	      	<!-- calender end -->
	  		</div>
	
<%}else{%>
	  
	 
	 		<!-- Calender start  -->
        
        <div class="col-md-3 calen">
         <!-- 4 nav -->
         <div class="col-md-12 sections" >
            <ul>
               <li class="notes">
               	<div class="button-1">
               	<div class="eff-1">
                  <a onclick="myFunction()" href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year - 1%>&amp;month=<%=month%>"   target="_self"> 이전해 </a>
               	</div>
               	</div>
               </li>
               <li class="notes">
               <div class="aftyear">
               <div class="aftyearon">
                  <a href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year + 1%>&amp;month=<%=month%>" target="_self"> 다음해   </a> 
               </div>
               </div>
               </li>
               <li class="calendar active">
               <div class="tod">
               <div class="todon">
                  <a href="javascript:location.href='<s:url value='/info/diary/diaryview.jsp'/>'" value="오늘">오늘</a>
               </div>
               </div>
               </li>
            </ul>
         </div>
	
			<!-- 달력 헤더 좌우 변경 : 현재 월단위 -->
			<section class="month" id="january"/>
			<header> <!-- 월 단위 변경 -->
				<%
					if (month > 0) {
				%>
					<a href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year%>&amp;month=<%=month - 1%>" target="_self"><b>&lt;</b></a>
				<%
			 	} %>
			 		<b> &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월 &nbsp;&nbsp;</b>
				<%
					if (month < 11) {
				%>
					<a href="<s:url value='/info/diary/diaryview.jsp'/>?year=<%=year%>&amp;month=<%=month + 1%>" target="_self"><b>&gt;</b></a> 
				<%
			 	} 
			 	%>
				<nav role='padigation'> <span></span> <span></span> </nav> 
			</header>
			
			<!-- 달력 부분 -->
			<article>
			<div class="col-md-12 days">
				<b>SU</b> <b>MO</b> <b>TU</b> <b>WE</b> <b>TH</b> <b>FR</b> <b>SA</b>
			</div>
			<div class="dates">
				<%
					for (int index = 1; index < start; index++) {
						out.println("<span>&nbsp;</span>");
						newLine++;
					}
					for (int index = 1; index <= endDay; index++) {
						String color = "";
						if (newLine == 0) {
							color = "RED";
						} else if (newLine == 6) {
							color = "#529dbc";
						} else {
							color = "BLACK";
						}
						
						String sUseDate = Integer.toString(year);
						sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
								: Integer.toString(month + 1);
						sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
								: Integer.toString(index);
						int iUseDate = Integer.parseInt(sUseDate);
						
						String backColor = "#EFEFEF";
						if (iUseDate == intToday) {
							backColor = "#c9c9c9";
						}
						out.println("<span bgcolor='");
		
						out.println( backColor ); 
			
						out.println("' nowrap>");
					
						out.println("<a href='/responser2005/info/diary/diaryview.jsp'>");
				%>
				<font color='<%=color%>'> <%=index%>
				</font>
				<%
						out.println("</a></span>"); 
		
						newLine++;
						if (newLine == 7) {
							out.println("<br>");
							if (index <= endDay) {
								out.println("</span>");
							}
							newLine = 0;
						}
					}
					//마지막 공란 LOOP
					while (newLine > 0 && newLine < 7) {
						out.println("<span>&nbsp;</span>");
						newLine++;
					}
				%>
			</div>
			</article> 
			</section>
			</div>
	      	<!-- calender end -->
	  		</div>
	
	  		
<%}%>  	
	 
	    <!-- 다이어리 게시판 목록 -->
        <h2>다이어리 게시판</h2>
        
		<div id="diary" class="col-md-9" >
  
<% 
DiaryDAO ddao = new DiaryDAO(); 
List<Diary> dlist = null;
dlist = ddao.totalDiary(memberid);

if(dlist != null){
for(int i=0; i<dlist.size(); i++){
	
%>			
	
  		<ul class="timeline">
    	<li><div class="tldate"><%=dlist.get(i).getString() %></div></li>
    	<li>
	     	<div class="tl-circ"></div>
	     	<div class="timeline-panel">
	        <div class="tl-heading">
	        	<h4><%=dlist.get(i).getSubject() %></h4>
	        <div class="tl-body">
	          <p><%=dlist.get(i).getContent() %></p>
	        </div>
	      </div>
	      </div>
      </li>
      </ul>
<% } 
}%>				
		
		</div>
	<!-- Modal Java Script -->
	<script type="text/javascript">
		var dropDown = document.getElementById("myDropdown");
		
		/* When the user clicks on the button, 
		toggle between hiding and showing the dropdown content */
		function myFunction() {
		  document.getElementById("myDropdown").classList.toggle("show");
		}
	
		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			 if (event.target == dropDown) {
	                dropDown.style.display = "none";
	            }
		}
		
		$('.carousel').carousel()
		$('body').scrollspy({ target: '.navbar-example' })
		$('#myScrollspy').on('activate.bs.scrollspy', function () {
  // do something…
})
	</script>
</body>
</html>