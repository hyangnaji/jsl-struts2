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

							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="fr_list">
							<form role="form" method="post">
							<tr>
								<input type="hidden" name="f_fromid"
									value="<s:property value="f_fromid"/>" />

								<td><input class="form-control" name="f_id" type="text"
									value="<s:property value="f_id"/>" readonly="readonly"></td>
								<td><a href="<s:property value="fr_address"/>"><s:property
											value="f_name" /></td>
								<td><input class="form-control" id="f_nickname"
									name="f_nickname" value="<s:property value="f_nickname"/>" type="text"></td>
								<td><button formaction="modifyFriend.action">별명변경</button></td>
								<td><button formaction="removemsg.action">절교</button></td>
							</tr>
							</form>
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

