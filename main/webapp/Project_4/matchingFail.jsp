<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%
String path=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 0;  
	color: rgb(94, 94, 94);
}
#header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 99999;
}
.banner {
	background-color: #ffffff;
	text-align: center;
	margin: 0;
}

.banner>img {
	width: 90px;
	height:80px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #ffffff;
	font-size: 16px;
}

li {
	float: left;
	margin: 0 35px 0 0;
}

li a {
	display: inline-block;
	width: 100px;
	color: rgb(94, 94, 94);
	text-align: center;
	padding: 10px 25px;
	text-decoration: none;
}

li a:hover {
	color: #ffffff;
	background-color: rgba(250, 80, 120, 0.9);
}

.search .serach-button{
	position: fixed;
	padding: 5px 5px;
	font-size: 8px;
	border: solid; 
	border-radius: 20px;
	border-color: rgb(220,220,220);
	width: 200px;
}
.search .serach-button:hover{
	border-color: rgba(250, 80, 120, 0.9);
}

.user-icon > span{
	position: fixed;
	display: inline-block;
	font-size: 38px;
	color: rgb(220,220,220);
	cursor: pointer;
}
.serach > span{
	position: fixed;
	display: inline-block;
	left: 280px;
	font-size: 20px;
	color: rgb(220,220,220);
	cursor: pointer;

}

.search{
	position: fixed;
	left: 1000px;
	top: 90px;
}

.user-icon{
	position: fixed;
	top: 20px;
	left: 1200px;
	z-index: 10;
	font-size: 20px;
}



#guard{
	height: 125px;
	width: 0;
}


.matching-message{
	position: absolute;
	left: 460px;
	top: 220px;
	color: rgb(250, 80, 120);
	
}
.matching3 > img{
	width: 130%;
	position: absolute;
}
.matching3{
	position: absolute;
	padding: 100px;
	left: 400px;
	top: 240px;
}

.matching-button > input{
	padding: 8px 60px;
	appearance: none;
	font-family: "Noto Sans KR", sans-serif;
	color: #FFFFFF;
	font-size: 16px;
	cursor: pointer;
	background-color: rgb(250, 80, 120);
	border: none;
	border-radius: 4px;
}	
.matching-button{
	position: absolute;
	left: 515px;
	top: 580px;
	padding: 0 0 80px 0;
}



@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
<script>
/*
 
 */
</script>
</head>
<body>
<div id="header">
	<div class="banner" href="#">
		<img
			src="VV.png">
	</div><!--
 --><div class="navigationbar">
		<ul>
			<li><a href="#">홈</a></li>
			<li><a href="#">매칭하기</a></li>
			<li><a href="#">마이프로필</a></li>
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">이벤트</a></li>
		</ul>
	</div>
	<div class="user-icon">
		<span class="material-icons">account_circle</span>
	</div>
	<div class="search">
		<input class="serach-button" type="text" name="search" placeholder="Search"/>
		<span class="material-icons">search</span>
	</div>
</div>
<div id="guard"></div>

<div class="wrap">
<div class="matching-message">
	<h1>매칭에 실패하였습니다</h1>
</div>
<div class="matching3">
	<img src="matching3.JPG">
</div>
<div class="matching-button">
	<input type="button" onclick="" name="success" value="홈으로 돌아가기">
</div>
</div>
</body>
</html>