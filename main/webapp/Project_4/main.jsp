<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
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

#footer {
	width: 100%;
	height: 150px;
	background-color: #D4DADE;
	font-size: 8px;
	padding: 20px 0 0 0;
}



/*
	.category{height: 60px;}
	
	.category>a{margin: 20px 20px 20px 20px; }
	.category>a:link{color: black; text-decoration: none;}
	.category>a:visited {color: black;}
	.category>a:hover {color: black; text-decoration: underline;}
	*/
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

	<div class="contents-slider" onclick="location.href='/webapp/project/notice_list.jsp'">
	<!-- 공지사항/이벤트 게시글 등록 후에 post 클래스에 onclick 추가로 변경  -->
		<div class="post">1</div>
		<div class="post">2</div>
		<div class="post">3</div>
		<div class="post">4</div>
		<div class="post">5</div>
	</div>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

	<script>
		$( document ).ready( function() {
		$('.contents-slider').slick({
		  autoplay : true, 
		  arrows : true,
		  infinite: true,
		  speed: 600,
		  slidesToShow: 1,
		  adaptiveHeight: true
		});
		});
	</script>

	<div class="cotents-review">리뷰</div><!--

 --><div class="contents-FAQ">FAQ</div>

	<div id="footer"><h4>회사소개</h4>
		<div class="footer1">
			<p>회사 | 이름</p>
			<p>대표자 | @@@</p>
			<p>이메일 | abc123@naver.com</p>
			<p>주소 | address</p>
			<p>COPYRIGHT (C)SAPPUN. ALL RIGHTS RESERVED.</p>
		</div>
			
		<div class="footer2">
		
		</div>
		
	</div>
	
</body>
</html>

