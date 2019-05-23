<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onLoad="popup()">

</body>

<script type="text/javascript">
window.onload = popup;

function popup(){	
	var mem_id = "${userid}";
	var popUrl ="http://localhost:8080/responser2005/world/"+mem_id+".jsp";
    var popOption = "width=1100px, height=650px, resizable=no, location=no, status=no, toolbar=no, scrollbars=no";
       
       window.open(popUrl, "_blank", popOption);   
};

</script>
</html>