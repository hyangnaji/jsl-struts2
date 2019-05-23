<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial;
}

* {
	box-sizing: border-box;
}

.openBtn {
	background: #f1f1f1;
	border: none;
	padding: 10px 15px;
	font-size: 20px;
	cursor: pointer;
}

.openBtn:hover {
	background: #bbb;
}

.overlay {
	height: 100%;
	width: 100%;
	display: none;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.9);
}

.overlay-content {
	position: relative;
	top: 46%;
	width: 80%;
	text-align: center;
	margin-top: 30px;
	margin: auto;
}

.overlay .closebtn {
	position: absolute;
	top: 20px;
	right: 45px;
	font-size: 60px;
	cursor: pointer;
	color: white;
}

.overlay .closebtn:hover {
	color: #ccc;
}

.overlay input[type=text] {
	padding: 15px;
	font-size: 17px;
	border: none;
	float: left;
	width: 80%;
	background: white;
}

.overlay input[type=text]:hover {
	background: #f1f1f1;
}

.overlay button {
	float: left;
	width: 20%;
	padding: 15px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.overlay button:hover {
	background: #bbb;
}
</style>
</head>
<body >

	<div id="myIdOverlay" class="overlay">
		<span class="closebtn" onclick="closeIdSearch()" title="Close Overlay">×</span>
		<div class="overlay-content">
			<form action="idfind.action" method="post"
				onsubmit="return idcheck();" name="idfindFrm">
				<input type="text" placeholder="Search.." id="userid" name="userid">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<div id="myNameOverlay" class="overlay">
		<span class="closebtn" onclick="closeNameSearch()"
			title="Close Overlay">×</span>
		<div class="overlay-content">
			<form action="namefind.action" method="post"
				onsubmit="return namecheck();" name="namefindFrm">
				<input type="text" placeholder="Search.." id="name" name="name">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>

	<h2>Fullscreen Search</h2>
	<p>Click on the button to open the search box.</p>
	<button class="openBtn" onclick="openIdSearch()">아이디로 찾기</button>
	<button class="openBtn" onclick="openNameSearch()">이름으로 찾기</button>
	<script>
		function idcheck() {

			var id = document.idfindFrm.getElementById("userid");
			if (idfindFrm.userid.value == "") {
				alert("아이디를 입력해 주세요");
				idfindFrm.userid.focus();
				return false;
			}

			return true;

		}

		function namecheck() {
			if (namefindFrm.name.value == "") {
				alert("이름을 입력해 주세요");
				namefindFrm.name.focus();
				return false;
			}
			return containsChars(input, chars);
		}
		function openNameSearch() {
			document.getElementById("myNameOverlay").style.display = "block";
		}
		function openIdSearch() {
			document.getElementById("myIdOverlay").style.display = "block";
		}
		function closeNameSearch() {
			document.getElementById("myNameOverlay").style.display = "none";
		}
		function closeIdSearch() {
			document.getElementById("myIdOverlay").style.display = "none";
		}
		function check(re, what, message) {
			if (re.test(what.value)) {
				return true;
			}
			alert(message);
			what.value = "";
			what.focus();
			return false;
		}
	</script>

</body>
</html>

<!-- <form  action="namefind.action" method="post">

  <div >
    <label for="f_name" class="sr-only">이름</label>
    <input type="text" name="name" placeholder="이름으로 찾기">
  
  <input type="submit" value="find"/></div>
</form>
<form  action="idfind.action" method="post">

  <div >
    <label for="f_id" class="sr-only">아이디</label>
    <input type="text" name="userid" placeholder="아이디로 찾기">
  
  <input type="submit" value="find"/></div>
</form>
  </body>
</html> -->