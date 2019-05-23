<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
${msg}

    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post">
				<div class="form-group">
					 
					<label for="exampleInputid1">
						아이디
					</label>
					<input class="form-control" name="f_id" type="text" value="${mem.userid}" readonly="readonly">
				</div>
				<div class="form-group">
					 
					<label for="exampleInputname1">
						이름
					</label>
					<input class="form-control" name="f_name" type="text" value="${mem.name}" readonly="readonly">
				</div>
				<div class="form-group">
					 
					<label for="exampleInputname1">
						닉네임
					</label>
					<input class="form-control" name="f_nickname" type="text" >
				</div>
				
				<div class="checkbox">
					 
					<label>
						<input type="checkbox"> Check me out
					</label>
				</div> 
				<button class="btn btn-primary" type="submit" formaction="insertfriend.action" >
					Submit
				</button>
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