<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
   content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onLoad="popup()">
   
</body>

<script>

window.onload = popup;

function popup(){
   
   var mem_id = "${f_id}";
   var popUrl ="http://localhost:8080/responser2005/world/"+mem_id+".jsp";
    var popOption = "width=1100px, height=650px, resizable=no, location=no, status=no, toolbar=no, scrollbars=no";
       
      window.open(popUrl, "_blank", popOption);   
};
</script>
</html>