<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <style>
/*-----Background-----*/

body{
	 background-image:url(https://s3.envato.com/files/243754334/primag.jpg);
	 background-repeat:no-repeat;
	 background-size:cover;
	 width:100%;
	 height:100vh;
	 overflow:auto;
	 
}

/*-----for border----*/
.container{
	font-family:Roboto,sans-serif;
	  background-image:url(https://image.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg) ;
    
     border-style: 1px solid grey;
     margin: 0 auto;
     text-align: center;
     opacity: 0.8;
     margin-top: 67px;
   box-shadow: 2px 5px 5px 0px #eee;
     max-width: 500px;
     padding-top: 10px;
     height: 363px;
     margin-top: 166px;
}
/*--- for label of first and last name---*/
.lastname{
	 margin-left: 1px;
     font-family: sans-serif;
     font-size: 14px;
     color: white;
     margin-top: 10px;
}
.firstname{
	 margin-left: 1px;
     font-family: sans-serif;
     font-size: 14px;
     color: white;
     margin-top: 5px;
}
#lname{
	 margin-top:5px;
}
	  

/*---for heading-----*/
.heading{
	 text-decoration:bold;
	 text-align : center;
	 font-size:30px;
	 color:#F96;
	 padding-top:10px;
}
/*-------for email----------*/
  /*------label----*/
#email{
	  margin-top: 5px;
}
/*-----------for Password--------*/
     /*-------label-----*/
.mail{
	 margin-left: 44px;
     font-family: sans-serif;
     color: white;
     font-size: 14px;
     margin-top: 13px;
}
.pass{
	 color: white;
     margin-top: 9px;
     font-size: 14px;
     font-family: sans-serif;
     margin-left: 6px;
     margin-top: 9px;
}
#password{
 margin-top: 6px;
}
/*------------for phone Number--------*/
      /*----------label--------*/
.pno{
	 font-size: 18px;
     margin-left: -13px;
     margin-top: 10px;
     color: #ff9;
	
}	

/*--------------for Gender---------------*/
     /*--------------label---------*/
.gender {
	 color: white;
     font-family: sans-serif;
     font-size: 14px;
     margin-left: 28px;
     margin-top: 8px;
}

     /*---------- for Input type--------*/
.col-xs-4.male{
	 color: white;
     font-size: 13px;
     margin-top: 9px;
     padding-bottom: 16px;
}
.col-xs-4.female {
     color: white;
     font-size: 13px;
     margin-top: 9px;
     padding-bottom: 16px;
	 padding-right: 95px;
}	
/*------------For submit button---------*/
.sbutton{
	 color: white;
     font-size: 20px;
     border: 1px solid white;
     background-color: #080808;
     width: 32%;
     margin-left: 41%;
     margin-top: 16px;
	 box-shadow: 0px 2px 2px 0px white;
  	   
   }
.btn.btn-warning:hover {
    box-shadow: 2px 1px 2px 3px #99ccff;
	background:#5900a6;
	color:#fff;
	transition: background-color 1.15s ease-in-out,border-color 1.15s ease-in-out,box-shadow 1.15s ease-in-out;
	
}	 
	  </style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="insertfriend.action" method="post">
		아이디:<input type="text" name="f_id" value="${mem.userid}"
			readonly="readonly"> <br>
			이름:<input type="text" name="f_name"
			value="${mem.name}" readonly="readonly"><br> 
			닉네임:<input type="text" name="f_nickname" /> <br>
			<input type="submit" value="보내기" />&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" />
	</form>
	 <a href="msgFriend.action" target="_blank">뒤로가기</a>
</body>
</html> --%>
<%@page import="model.Member"%>
<%@page import="controller.MemberDAO"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form role="form" method="post">
					<div class="form-group">

						<label for="exampleInputid1"> 아이디 </label> 
						<input class="form-control" name="f_id" type="text"
							value="${mem.userid}"  readonly="readonly">
					</div>
					<div class="form-group">

						<label for="exampleInputname1"> 이름 </label> <input
							class="form-control" name="f_name" type="text"
							value="${mem.name}" readonly="readonly">
					</div>
					<div class="form-group">

						<label for="exampleInputname1"> 닉네임 </label> <input
							class="form-control" name="f_nickname" type="text">
					</div>

					<div class="checkbox">

						<label> <input type="checkbox"> Check me out
						</label>
					</div>
					<button class="btn btn-primary" type="submit"
						formaction="insertfriend.action">Submit</button>
				</form>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
</body>
</html>

