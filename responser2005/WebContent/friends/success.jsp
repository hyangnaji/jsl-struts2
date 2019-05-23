<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<s:iterator value="m_list">

<tr align="center">
<td><s:property value="name"/></td>
<td><a href="<s:property value="address"/>">주소로가기</a></td>
<td><s:property value="userid"/></td>
<td><a href="checkfmsg.action?f_toid=<s:property value="userid"/>" target="_blank">친구추가메세지 보내기</a></td>
</tr>
</s:iterator>
	
<s:iterator value="mem">
	<tr align="center">
<td><s:property value="name"/></td>
<td><a href="<s:property value="address"/>">주소로가기</a></td>
<td><s:property value="userid"/></td>
<td><a href="checkfmsg.action?f_toid=<s:property value="userid"/>" target="_blank">친구추가메세지 보내기</a></td>
</tr>
</s:iterator>

					
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