<%@page import="model.Photo"%>
<%@page import="java.util.List"%>
<%@page import="model.Diary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.PhotoDAO"%>
<%@page import="controller.DiaryDAO"%>
<%@page import="model.Info"%>
<%@page import="controller.InfoDAO"%>
<%@page import="java.io.Console"%>
<%@page import="model.Music"%>
<%@page import="controller.MusicDAO"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="controller.MemberDAO"%>
<%@page import="model.Member"%>


<%
	String id, name, email = null;
	int phone, musiccode = 0;
	String phoneNum = null;

	String myid = (String) ActionContext.getContext().getSession().get("userid"); //현재 내 아이디
	String memberhome = request.getServletPath().toString();
	String[] array = memberhome.split("/");

	String cut = array[2]; //주소의 아이디	+.jsp
	int indexnumber = cut.lastIndexOf("."); //jsp 빼내기 위함
	String memberid = cut.substring(0, indexnumber); //주소의 아이디만 가져옴
	MemberDAO dao = new MemberDAO();
	Member mem = null;

	InfoDAO infodao = new InfoDAO();
	Info info = null;

	mem = dao.searchMember(memberid);
	info = infodao.searchInfo(mem);

	String picture = info.getI_pic();

	session.setAttribute("memberid", mem.getUserid());

	ActionContext context = ActionContext.getContext();//session을 생성하기 위해
	Map<String, Object> membersession = (Map<String, Object>) context.getSession();// Map 사용시
	membersession.put("memberid", memberid);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" href="/responser2005/css/normalize.css">
<link rel="stylesheet" href="/responser2005/css/normalize_style.css"> -->

<link rel="stylesheet" href="/responser2005/css/w3www.css">
<link rel="stylesheet" href="/responser2005/css/main.css">
<link rel="stylesheet"	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/responser2005/css/firends_type.css">

<title>Insert title here</title>
</head>
<%@include file="/info/header.jsp"%>

<%
	if (memberid.equals(myid)) { //내홈피
%>
<!-- 뒤 배경 -->
<body>
	<!-- Page Container -->
	<div class="w3-content w3-margin-top">
		<div class="homepage_title" align="center">
			<!-- 홈페이지 타이틀 -->
			<h3><%=info.getI_name()%></h3>
		</div>
		<!-- The Grid -->
		<div class="profiles" style="float: left">
			<!-- Left Column -->
			<div class="w3-third">
				<div class="image_image">
					<div class="w3-display-container" align="center">
						<img alt="<%=info.getI_id()%>" src="<%=picture%>" width="150px"	height="150px">
					</div>
				</div>

				<div class="w3-container w3-white">
					<p>
						<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mem.getName()%>
						(<a onclick="setting.action"><%=mem.getUserid()%></a>)
					</p>
					<%
						if (info.getI_open() == 0) {
					%>
					<p>
						<i
							class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mem.getEmail()%></p>
					<p>
						<i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mem.getPhone()%></p>
					<%
						}
					%>
					<hr>

					<p class="w3-large">
						<p class = "w3-large"><i
							class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Intro</p>
					</p>
					<div class="w3-white w3-round-xlarge w3-small">
						<div class="introduce_myself">
							<%=info.getI_intro()%>
						</div>
						<br>
					</div>
					<br>
					<div class="w3-white w3-round-xlarge w3-small">
						<div class="friend_ok" align="center">
							<!-- 친구관련 -->
							<a href="surfRiding.action">파도타기 </a> &nbsp; <a
								href="usersearch.action" target="_blank">친구찾기</a> &nbsp; <a
								href="msgFriend.action" target="_blank">메세지</a> &nbsp; <a
								href="friendlist.action" target="_blank">친구목록</a>
						</div>
					</div>
				</div>

				<!-- End Left Column -->

			</div>

		</div>

		<%
			DiaryDAO d_dao = new DiaryDAO();
				PhotoDAO p_dao = new PhotoDAO();

				Diary diary = new Diary();
				Photo photo = new Photo();

				List<Diary> d_list = null;
				List<Photo> p_list = null;

				d_list = d_dao.totalDiary(memberid);
				p_list = p_dao.phtoList(memberid);
		%>

		<!-- Right Column -->
		<div class="new_news" style="float: left;">
			<!-- 다이어리관련 -->
			<div class="w3-container w3-card w3-white w3-margin-bottom">
				<h4 class="w3-text-grey w3-padding-16">
					&nbsp;최근 다이어리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 12px">최근에
						쓰여진 다이어리 기록입니다.</b>
				</h4>
				<div class="w3-container">

					<%
						//다이어리 리스트 확인
							if (d_list.size() > 0) {
								for (int i = 0; i < d_list.size(); i++) {
									if (i == 2)
										break;
									diary.setSubject(d_list.get(i).getSubject());
									diary.setString(d_list.get(i).getString());
					%>
					<p class="w3-text-teal">
						<i class="fa fa-calendar fa-fw w3-margin-right"></i><%=diary.getString()%>&nbsp;&nbsp;
						<a
							href="/responser2005/info/diary/diaryview.action?memberid=<%=memberid%>"><%=diary.getSubject()%></a>
					</p>
					<hr>
					<%
						}
							} else {
					%>
					<p>
						최근에 작성된 다이어리 글이 없습니다.&nbsp;&nbsp;<a
							href="/responser2005/info/diary/diaryview.action?memberid=<%=memberid%>">작성하러 가기</a>
					<p>
						<%
							}
						%>
					
					<h4 class="w3-text-grey w3-padding-16">
						&nbsp;최근 사진첩 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b
							style="font-size: 12px">최근에 올라온 사진 기록입니다.</b>
					</h4>
					<div class="w3-container">
						<%
							//사진첩 확인	
								if (p_list.size() > 0) {
									for (int i = 0; i < p_list.size(); i++) {
										if (i == 3)
											break;
										photo.setP_subject(p_list.get(i).getP_subject());
										photo.setP_day(p_list.get(i).getP_day());
						%>
						<p class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i><%=photo.getP_day()%>
							&nbsp; <a
								href="/responser2005/iterator.action?memberid=<%=memberid%>"><%=photo.getP_subject()%></a>
						</p>
						<hr>
						<%
							}
								} else {
						%>
						<p>
							최근에 작성된 사진첩 글이 없습니다.&nbsp;&nbsp;<a
								href="/responser2005/info/photo/iterator.action?memberid=<%=memberid%>">작성하러
								가기</a>
						<p>
							<%
								}
							%>
						
					</div>
				</div>

				<!-- End Right Column -->
			</div>



			<!-- End Grid -->
		</div>
		<!-- End Page Container -->
	</div>
	
	<div class="category">
					<button id="diary" type="button" class="c_btn"
						onclick="location.href='diaryview.action?memberid=<%=memberid%>'"
						target="_blank">
						DIARY&nbsp;<i id="c_icon" class="material-icons">event_note</i>
					</button>
					<button id="photo" type="button" class="c_btn"
						onclick="location.href='iterator.action?memberid=<%=memberid%>'"
						target="_blank">
						PHOTO&nbsp;<i id="c_icon" class="material-icons">collections</i>
					</button>
					<button id="music" type="button" class="c_btn" onclick="change();">
						MUSIC&nbsp; <i id="c_icon" class="material-icons">audiotrack</i>
					</button>
					<button id="setting" class="c_btn"
						onclick="location.href='setting.action?memberid=<%=memberid%>'"
						target="_blank">SETTING&nbsp; <i id="c_icon" class="material-icons">settings</i>
					</button>
		</div>


</body>


<!-- form -->



<%
	} else {

		if (mem != null) {

			id = (String) session.getAttribute("memberid");
			session.setAttribute("membername", mem.getName());
			name = (String) session.getAttribute("membername");

			session.setAttribute("memberemail", mem.getEmail());
			email = (String) session.getAttribute("memberemail");
			session.setAttribute("memberphone", mem.getPhone());
			phone = Integer.parseInt((String) session.getAttribute("memberphone"));

		} else {
			id = "불러오지 못함";
			name = "불러오지 못함";
			email = "불러오지 못함";
			phoneNum = "01011111111";
			musiccode = 0;
		}
%>
<!-- 다른 사람 홈피 -->
<!-- profile -->
<div class="over">
	<s:if test="%{msg !=null}">
		<form method="post" action="addfriend.action">
			<input type="text" value="${msg }" readonly/>
			<button class=""></button>
		</form>
	</s:if>
</div>

<body>
	<!-- Page Container -->
	<div class="w3-content w3-margin-top">
		<div class="homepage_title" align="center">
			<!-- 홈페이지 타이틀 -->
			<h3><%=info.getI_name()%></h3>
		</div>
		<!-- The Grid -->
		<div class="profiles" style="float: left">
			<!-- Left Column -->
			<div class="w3-third">
				<div class="image_image">
					<div class="w3-display-container" align="center">
						<img alt="<%=info.getI_id()%>" src="<%=picture%>" width="150px"	height="150px">
					</div>
				</div>

				<div class="w3-container w3-white">
					<p>
						<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mem.getName()%>
						(<%=mem.getUserid()%>)
					</p>
					<%
						if (info.getI_open() == 0) {
					%>
					<p>
						<i
							class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mem.getEmail()%></p>
					<p>
						<i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mem.getPhone()%></p>
					<%
						}
					%>
					<hr>

					<p class="w3-large">
						<p class = "w3-large"><i
							class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Intro</p>
					</p>
					<div class="w3-white w3-round-xlarge w3-small">
						<div class="introduce_myself">
							<%=info.getI_intro()%>
						</div>
						<br>
					</div>
					<br>
					<div class="w3-white w3-round-xlarge w3-small">
						<div class="friend_ok" align="center">
                     <!-- 친구관련 -->
                     <a onclick="window.open('http://localhost:8080/responser2005/friends/friendreg.jsp?f_id=<%=mem.getUserid()%>','친구추가','height=300, width=500');">친구추가</a>
                     &nbsp;&nbsp;&nbsp;
                     <a href="http://localhost:8080/responser2005/world/index_success.jsp">내 홈피</a>
                  </div>
					</div>
				</div>

				<!-- End Left Column -->

			</div>

		</div>

		<%
			DiaryDAO d_dao = new DiaryDAO();
				PhotoDAO p_dao = new PhotoDAO();

				Diary diary = new Diary();
				Photo photo = new Photo();

				List<Diary> d_list = null;
				List<Photo> p_list = null;

				d_list = d_dao.totalDiary(memberid);
				p_list = p_dao.phtoList(memberid);
		%>

		<!-- Right Column -->
		<div class="new_news" style="float: left;">
			<!-- 다이어리관련 -->
			<div class="w3-container w3-card w3-white w3-margin-bottom">
				<h4 class="w3-text-grey w3-padding-16">
					&nbsp;최근 다이어리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 12px">최근에
						쓰여진 다이어리 기록입니다.</b>
				</h4>
				<div class="w3-container">

					<%
						//다이어리 리스트 확인
							if (d_list.size() > 0) {
								for (int i = 0; i < d_list.size(); i++) {
									if (i == 2)
										break;
									diary.setSubject(d_list.get(i).getSubject());
									diary.setString(d_list.get(i).getString());
					%>
					<p class="w3-text-teal">
						<i class="fa fa-calendar fa-fw w3-margin-right"></i><%=diary.getString()%>&nbsp;&nbsp;
						<a
							href="/responser2005/info/diary/diaryview.action?memberid=<%=memberid%>"><%=diary.getSubject()%></a>
					</p>
					<hr>
					<%
						}
							} else {
					%>
					<p>
						최근에 작성된 다이어리 글이 없습니다.
					<p>
						<%
							}
						%>
					
					<h4 class="w3-text-grey w3-padding-16">
						&nbsp;최근 사진첩 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b
							style="font-size: 12px">최근에 올라온 사진 기록입니다.</b>
					</h4>
					<div class="w3-container">
						<%
							//사진첩 확인	
								if (p_list.size() > 0) {
									for (int i = 0; i < p_list.size(); i++) {
										if (i == 3)
											break;
										photo.setP_subject(p_list.get(i).getP_subject());
										photo.setP_day(p_list.get(i).getP_day());
						%>
						<p class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i><%=photo.getP_day()%>
							&nbsp; <a
								href="/responser2005/iterator.action?memberid=<%=memberid%>"><%=photo.getP_subject()%></a>
						</p>
						<hr>
						<%
							}
								} else {
						%>
						<p>
							최근에 작성된 사진첩 글이 없습니다。
						<p>
							<%
								}
							%>
						
					</div>
				</div>

				<!-- End Right Column -->
			</div>



			<!-- End Grid -->
		</div>
		<!-- End Page Container -->
	</div>
	
	<div class="category">
					<button id="diary" type="button" class="c_btn"
						onclick="location.href='diaryview.action?memberid=<%=memberid%>'"
						target="_blank">
						DIARY&nbsp;<i id="c_icon" class="material-icons">event_note</i>
					</button>
					<button id="photo" type="button" class="c_btn"
						onclick="location.href='iterator.action?memberid=<%=memberid%>'"
						target="_blank">
						PHOTO&nbsp;<i id="c_icon" class="material-icons">collections</i>
					</button>
					<button id="music" type="button" class="c_btn" onclick="change();">
						MUSIC&nbsp; <i id="c_icon" class="material-icons">audiotrack</i>
					</button>
		</div>


</body>
<%
	}
%>

<script type="text/javascript">
	function out() {
		opener.location.href = "http://localhost:8080/responser2005/logout.action";
		window.close();
	}

	function change() {
		opener.location.href = "http://localhost:8080/responser2005/member/musiclist.jsp";
		window.close();
	}

	function diary() {
		opener.location.href = "http://localhost:8080/responser2005/diaryview.action";
		window.close();
	}

	function photo() {
		opener.location.href = "http://localhost:8080/responser2005/iterator.action";
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