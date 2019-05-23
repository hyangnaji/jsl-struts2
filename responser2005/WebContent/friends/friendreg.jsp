<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>퍽</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>
<%	
String f_fromid = (String)ActionContext.getContext().getSession().get("userid");
String f_toid = (String)ActionContext.getContext().getSession().get("memberid");
%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>보내는 사람</th>
							<th>받는 사람</th>
							<th>별명</th>
							<th>메세지</th>
						</tr>
					</thead>
					<tbody>
					<tr>
					<form action="sendfmsg.action" method="POST">
   						<td><input name="f_fromid" type="text" value="<%=f_fromid%>"readonly="readonly"> </td>		<!-- 내 아이디 -->
						<td><input name="f_toid" type="text" value="<%=f_toid%>" readonly="readonly"> </td>			<!-- 친구아이디 -->
 
   						<td><input name="f_tonick" type="text" maxlength="10" placeholder="별명(10자 이하)"> </td>	<!-- 별명 -->

  						<td><textarea name="f_msg" placeholder="Test Message"></textarea> </td>			<!-- 신청메세지 -->
  					<button type="submit">Send</button>
  					<button type="reset">cancel</button>
					</form>
					</tr>
					
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
