<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.PreDAO"
    import="db.*"
    %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(약관동의)</title>
<link rel="stylesheet" href="signupcss.css">
</head>
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
.contents-slider {
   background-color: #ffaaaa;
   height: 400px;
}

.contents-slider .slick-arrow {
   display: block;
   position: absolute;
   left: 95%;
   top: 50%;
   z-index: 1;
}

.contents-slider .slick-dots {
   display: inline;
   text-align: center;
}

.cotents-review {
   display: inline-block;
   padding: 10px 0 0 0;
   width: 50%;
   height: 260px;
   background-color: #F38FAE;
}

.contents-FAQ {
   display: inline-block;
   text-align: right;
   padding: 10px 0 0 0;
   width: 50%;
   height: 260px;
   background-color: #F56694;
}

.footer {
   width: 100%;
   height: 150px;
   background-color: #D4DADE;
}
</style>
<body>

<jsp:useBean id="users" class="db.Users001" scope="session"/>

<div id="header">
   <div class="banner" onclick="location.href='main.jsp'">
      <img
         src="V.jpg">
   </div><!--
 --><div class="navigationbar">
      <ul>
         <li><a href="main.jsp">홈</a></li>
         <li><a href="matching.jsp">매칭하기</a></li>
         <li><a href="profile.jsp">마이프로필</a></li>
         <li><a href="board.jsp">자유게시판</a></li>
         <li><a href="notice.jsp">커뮤니티</a></li>
      </ul>
   </div>
</div>
<div id="guard"></div>
<div class=divm>

<script type="text/javascript">


	// 약관동의합니다 체크 여부 확인
	function check(){
		if(document.getElementById('agree_o').checked) {
			alert("약관 동의 완료.")
			location.href = "signup.jsp"
			return;
		}else if(document.getElementById('agree_x').checked) {
			alert("약관에 동의해주세요.")
			return
		}else{
			alert("약관에 동의해주세요.")
			return;
		}
	}

</script>
<%
	String agree = request.getParameter("agree"); if(agree==null) agree="";
%>
	<h1 align="center">회원가입</h1>
<form class = loginform >
	<h2 align="center">이용 약관</h2>
	<iframe name="terms" width="100%" height="50%" src="terms.jsp"></iframe><br>
	<input type="radio" name="agree" id= "agree_o" value="동의합니다.">동의합니다.
	<input type="radio" name="agree" id= "agree_x"value="동의하지 않습니다.">동의하지 않습니다.<br>
	<input class="nextform" type="button" name="join" value="다음" onclick="check()">
</form>
</div>
</body>
</html>