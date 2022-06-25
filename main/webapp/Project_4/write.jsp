<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equive="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>Insert title here</title>
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

#guard{
	height: 125px;
	width: 0;
}

#board {
	position: absolute;
	background-color: rgba(250, 80, 120, 0.05);
	width: 80%;
	height: 500px;
	left: 125px;
	padding: 0 0 100px 0;
	color: rgb(94, 94, 94);
}
.board-table,td{
	border: 1px solid rgb(220,220,220);
 	border-collapse: collapse;
	}
.board-table{
	position: absolute;
	text-align: center;
	width: 80%;
	margin: 10px 0 150px 100px;
}

td:nth-child(odd) {
  background-color: #fdc9dfff;
}

.table-text > input{
	height: 50px;
	margin: 0 10px 0 0;
}

.contents > textarea{
	height: 400px;
	margin: 0 10px 0 0;
}

#board > h2{
	text-align: center;
}

.submit{
	position: absolute;
	left: 574px;
	top: 600px;
}
.insert{
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
}
.cancel{
	position: absolute;
	appearance: none;
	font-family: "Noto Sans KR", sans-serif;
	color: #FFFFFF;
	font-size: 16px;
	padding: 5px 10px;
	cursor: pointer;
	background-color: rgb(220,220,220);
	border: none;
	border-radius: 4px;
	left: 60px;
}


@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
</head>
<body>
<div id="header">
	<div class="banner" onclick="location.href='main.jsp'">
		<img
			src="VV.png">
	</div><!--
 --><div class="navigationbar">
		<ul>
			<li><a href="main.jsp">홈</a></li>
			<li><a href="matching.jsp">매칭하기</a></li>
			<li><a href="profile.jsp">마이프로필</a></li>
			<li><a href="board.jsp">자유게시판</a></li>
			<li><a href="project/notice_list.jsp">커뮤니티</a></li>
		</ul>
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
	String id =null;
	if(session.getAttribute("id")!=null){
		id = (String)session.getAttribute("id");
	}
%>
 <!-- 제목 글자수 제한: 30자	작성자: 5자 내용:500자 -->
<div id="board">
	<h2>글 작성</h2>
	<form method="post" action="writeAction.jsp">
	<table class="board-table">
		<tr class="table-text"><td>제목</td><td colspan="3"><input type="text" name="bbsTitle" size=98 maxlength=30></td></tr>
		<tr class="contents"><td>내용</td><td colspan="3"><textarea cols="100" rows="20" name="bbsContent"></textarea></td></tr>
	</table>
	</form>
</div>

<div class="submit">
	<input class="insert" type="submit" value="등록" >
	<input class="cancel" type="button" value="취소" onclick="location.href='board.jsp'">
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>