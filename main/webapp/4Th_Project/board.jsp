<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>board</title>
<style>
body {
	margin: 0;  
	color: rgb(94, 94, 94);
	font-family: "Noto Sans KR", sans-serif;
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
	cursor: pointer;
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

li > a {
	display: inline-block;
	width: 100px;
	color: rgb(94, 94, 94);
	text-align: center;
	padding: 10px 25px;
	text-decoration: none;
}

li > a:hover {
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
.search > span{
	position: fixed;
	display: inline-block;
	left: 1190px;
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

.login{
	position: fixed;
	top:5px;
	left: 1050px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 6px;
	text-decoration: none;
	color: rgb(94, 94, 94);
}
.logout{
	position: fixed;
	top:5px;
	left: 1100px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 6px;
	text-decoration: none;
	color: rgb(94, 94, 94);
}

.signup{
	position: fixed;
	top:5px;
	left: 1150px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 6px;
	text-decoration: none;
	color: rgb(94, 94, 94);
}

#guard{
	height: 125px;
	width: 0;
}

.board-table {
	border-collapse: collapse;
	width: 100%;
	margin: 60px 0 0 0;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #DDD;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
}

th{
	background-color: rgb(220,220,220);
}

td{
	font-size: 12px;
}

.contents:hover {
	background-color: rgba(250, 80, 120, 0.1);
}

#board {
	position: absolute;
	background-color: rgba(250, 80, 120, 0.05);
	width: 80%;
	height: 600px;
	left: 125px;
	padding: 20px 0 100px 0;
	color: rgb(94, 94, 94);
}
#board > h2{
	position: absolute;
	left: 50px;
}
.board-table{
	margin: 100px 0 0 0;
}

.board-write-button{
	position: absolute;
	appearance: none;
	font-family: "Noto Sans KR", sans-serif;
	color: #FFFFFF;
	font-size: 16px;
	padding: 5px 10px;
	cursor: pointer;
	background-color: rgb(250, 80, 120);
	border: none;
	border-radius: 4px;
	left: 880px;
	z-index: 1;
	bottom: 645px;
}


@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
</head>
<body>
<%
// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크

String userno = (String)session.getAttribute("userno");
if(userno==null) userno = "";
%>

<div id="header">
	<div class="banner" onclick="location.href='main.jsp'">
		<img
			src="VV.png">
	</div><!--
 --><div class="navigationbar">
		<ul>
			<li><a href="main.jsp">홈</a></li>
			<li><a href="matchingLoc.jsp">매칭하기</a></li>
			<li><a href="profile.jsp">마이프로필</a></li>
			<li><a href="list.jsp">자유게시판</a></li>
			<li><a href="notice_list.jsp">커뮤니티</a></li>
		</ul>
	</div>
	<%if(userno.equals("")){%>
	<div class="login">
		<a href="login.jsp">LOGIN</a>
	</div>
	<%}else{%>
	<div class="logout">
		<a href="logoutAction.jsp">LOGOUT</a>
	</div>
	<%}%>
	<div class="signup">
		<a href="signup_agreement.jsp">JOINUS</a>
	</div>
	<div class="user-icon">
		<span class="material-icons" onclick="location.href='profile.jsp'">account_circle</span>
	</div>
	<div class="search">
		<input class="serach-button" type="text" name="search" placeholder="search" />
		<span class="material-icons">search</span>
	</div>
</div>
<div id="guard"></div>


<%
String id = (String)session.getAttribute("id");
%>
<script>
function gologin(){
	alert("로그인이 필요한 서비스입니다.");
	location.href="login.jsp";
}
</script>
<div id="board">
<h2>자유게시판</h2>
	<table class="board-table">
	  <tr>
	    <th>No.</th>
	    <th>제목</th>
	    <th>작성자</th>
	    <th>작성일</th>
	  </tr>
	  <tr class="contents">
	    <td>1</td>
	    <td>안녕하세요</td>
	    <td>홍길동</td>
	    <td>2022-06-23</td>
	  </tr>
	</table>
	
	<div class="board-write">
	<%if(id!=null){%>
	<input class="board-write-button" type="button" value="글작성" onclick="location.href='board_write.jsp'">
	<%}else{%>
	<input class="board-write-button" type="button" value="글작성" onclick="gologin()">
	<%}%>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>