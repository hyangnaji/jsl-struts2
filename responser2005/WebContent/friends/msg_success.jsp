
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
<style>
* {
  box-sizing: border-box;
}
body{
background-image:url("/responser2005/css/image/swlee.jpg");

}
button{
   background: #FBCBBF;
   color: #FFFFFF;
}
#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
<table id="myTable">
  <tr class="header">
    <th style="width:40%; text-align:center;">내용</th>
    <th style="width:15%; text-align:center;">보낸이</th>
    <th style="width:15%; text-align:center;">이름</th>
     <th style="width:15%; text-align:center;">확인</th>
      <th style="width:15%; text-align:center;">삭제</th>
  </tr>
  <s:iterator value="f_list">
                     <tr>
                        <td><s:property value="f_msg" /></td>
                        <td><a href="<s:property value="f_address"/>"><s:property
                                 value="f_fromid" /></a></td>
                        <td><s:property value="f_fromname" /></td>
                        <td><a
                           href="addfmsg.action?f_fromid=<s:property value="f_fromid"/>">확인</a></td>
                        <td><a
                           href="removemsg.action?f_fromid=<s:property value="f_fromid"/>">삭제</a></td>
                     </tr>
                  </s:iterator>
</table>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>