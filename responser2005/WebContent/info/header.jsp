<%@page import="model.Music"%>
<%@page import="controller.MusicDAO"%>
<%@page import="java.util.Map"%>
<%@page import="controller.VisitCountDAO"%>
<%@page import="controller.InfoDAO"%>
<%@page import="model.Info"%>
<%@page import="model.Member"%>
<%@page import="controller.MemberDAO"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/responser2005/css/main.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">    
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
  </body>
</html>
<%
	String path = (String)ActionContext.getContext().getSession().get("memberid");	
	String uus = (String)ActionContext.getContext().getSession().get("userid");
	
	MemberDAO mem__dao = new MemberDAO();
	Member member__id = mem__dao.searchMember(path);
	
	MusicDAO musicdao = new MusicDAO();
	Music music_code = musicdao.selectcode(member__id.getM_code());
	
	
	VisitCountDAO v_dao = new VisitCountDAO();
	//방문자 수 올리기 (내 아이디로 상대방 주소를)
	v_dao.setTotalCount(uus, member__id.getAddress());
	// 총 방문자 수 (해당 홈피의)
	int totalCount = v_dao.getTotalCount(path, member__id.getAddress());
	// 오늘 방문자 수 (해당 홈피의)
	int todayCount = v_dao.getTodayCount(path, member__id.getAddress());
	 
	ActionContext a_context = ActionContext.getContext();//session을 생성하기 위해
	Map<String, Object> h_session = (Map<String, Object>)a_context.getSession();// Map 사용시 
	
	// 세션에 방문자 수를 담는다.
	h_session.put("total", totalCount); 
	h_session.put("today", todayCount);
%>

	<div class="col-md-12 header">
		<!-- header & logout -->
		<div class="home">
			<button class="h_btn" onclick="location.href='http://localhost:8080/responser2005/world/<%=path%>.jsp'" target="_blank">
					<i class="material-icons">home</i>
			</button>
		</div>
		
		<div class="col-md-4 count">
			today | <span style="color: red"><%=h_session.get("today")%></span>    total | <span style="color: red"><%=h_session.get("total")%></span>
		</div>
		
		<div class="col-md-4 player">
			  <audio class="bgm_player_wrap.widget_t2" id="music" src="/responser2005/music/<%=music_code.getMusiccode()%>.mp3" autoplay controls loop></audio>
		</div>
		
		<div class="col-md-1">
			<button class="logout" onclick="out();">
			<!-- <i class="material-icons">directions_run</i> -->
			<i class="material-icons">power_settings_new</i>
			</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	function out() {
		opener.location.href = "http://localhost:8080/responser2005/logout.action";
		window.close();
	}
</script>
</html>