<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#header .user-icon{
	position: absolute;
	top: 20px;
	left: 1200px;
}

#guard{
	height: 125px;
	width: 0;
}

.matching1{
	position: absolute;
	left: 560px;
	top: 200px;
}

.loc-checkbox{
	position: absolute;
	left: 530px;
	top: 400px;
}
.loc-dropdown1{
	display: inline-block;
}

.loc-dropdown2{
	display: inline-block;
}
.loc-dropdown3{
	display: inline-block;
}


.loc-dropdown{
	position: absolute;
	left: 420px;
	top: 460px;
}

.age-dropdown1{
	display: inline-block;
}

.age-dropdown2{
	display: inline-block;
}

.age-dropdown{
	position: absolute;
	left: 500px;
	top: 520px;
}

.matching-button{
	position: absolute;
	left: 470px;
	top: 500px;
	padding: 80px;
	
}

.matching-button>input{
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

@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div id="header">
	<div class="banner">
		<img
			src="VV.png" href="#">
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
</div>
<div id="guard"></div>

<div class="matching1">
	<img src="matching1.JPG">
</div>
<%
	// 매칭을 위한 지역과 나이정보 변수 선언
	String loc = request.getParameter("loc");
	if(loc==null) loc = "";
	String ageS = request.getParameter("age");
	int age = 0;
	if(ageS!=null&&!ageS.trim().equals("")) age = Integer.parseInt(ageS);
%>
<form class="loc">
	<div class="loc-checkbox">
		 같은 지역 <input type="radio" name="loc" value="sameloc" onClick="this.form.selected.disabled=true">&nbsp;&nbsp;&nbsp;&nbsp;
		 지역 선택<input type="radio" name="loc" value="selectloc" onClick="this.form.selected.disabled=false">
	</div>

<div class="age-dropdown">
	<div class="age-dropdown1">
		상대방 나이 <select name='age'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='1990'>29세</option>
		  <option value='1991'>28세</option>
		  <option value='1992'>27세</option>
		  <option value='1993'>26세</option>
		  <option value='1994'>25세</option>
		  <option value='1995'>24세</option>
		  <option value='1996'>23세</option>
		  <option value='1997'>22세</option>
		  <option value='1998'>21세</option>
		  <option value='1999'>20세</option>
		</select>
	</div> ~
	
	<div class="age-dropdown2">
		<select name='age'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='1990'>29세</option>
		  <option value='1991'>28세</option>
		  <option value='1992'>27세</option>
		  <option value='1993'>26세</option>
		  <option value='1994'>25세</option>
		  <option value='1995'>24세</option>
		  <option value='1996'>23세</option>
		  <option value='1997'>22세</option>
		  <option value='1998'>21세</option>
		  <option value='1999'>20세</option>
		</select>
	</div>
</div>

<div class="loc-dropdown">
	<div class="loc-dropdown1">
		지역 선택 <select name='loc'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='seoul'>서울특별시</option>
		  <option value='gyeonggido'>경기도</option>
		  <option value='incheon'>인천광역시</option>
		  <option value='busan'>부산광역시</option>
		  <option value='daegu'>대구광역시</option>
		  <option value='gwangju'>광주광역시</option>
		  <option value='daejeon'>대전광역시</option>
		  <option value='ulsan'>울산광역시</option>
		  <option value='sejong'>세종특별자치시</option>
		  <option value='gangwondo'>강원도</option>
		  <option value='chungcheongnamdo'>충청남도</option>
		  <option value='chungcheongbukdo'>충청북도</option>
		  <option value='jeollanamdo'>전라남도</option>
		  <option value='jeollabukdo'>전라북도</option>
		  <option value='gyeongsangnamdo'>경상남도</option>
		  <option value='gyeongsangbukdo'>경상북도</option>
		  <option value='jejudo'>제주특별자치도</option>
		</select>
	</div>
	
	<div class="loc-dropdown2">
		<select name='loc'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='none'>선택안함</option>
		  <option value='seoul'>서울특별시</option>
		  <option value='gyeonggido'>경기도</option>
		  <option value='incheon'>인천광역시</option>
		  <option value='busan'>부산광역시</option>
		  <option value='daegu'>대구광역시</option>
		  <option value='gwangju'>광주광역시</option>
		  <option value='daejeon'>대전광역시</option>
		  <option value='ulsan'>울산광역시</option>
		  <option value='sejong'>세종특별자치시</option>
		  <option value='gangwondo'>강원도</option>
		  <option value='chungcheongnamdo'>충청남도</option>
		  <option value='chungcheongbukdo'>충청북도</option>
		  <option value='jeollanamdo'>전라남도</option>
		  <option value='jeollabukdo'>전라북도</option>
		  <option value='gyeongsangnamdo'>경상남도</option>
		  <option value='gyeongsangbukdo'>경상북도</option>
		  <option value='jejudo'>제주특별자치도</option>
		</select>
	</div>
	
	<div class="loc-dropdown3">
		<select name='loc'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='none'>선택안함</option>
		  <option value='seoul'>서울특별시</option>
		  <option value='gyeonggido'>경기도</option>
		  <option value='incheon'>인천광역시</option>
		  <option value='busan'>부산광역시</option>
		  <option value='daegu'>대구광역시</option>
		  <option value='gwangju'>광주광역시</option>
		  <option value='daejeon'>대전광역시</option>
		  <option value='ulsan'>울산광역시</option>
		  <option value='sejong'>세종특별자치시</option>
		  <option value='gangwondo'>강원도</option>
		  <option value='chungcheongnamdo'>충청남도</option>
		  <option value='chungcheongbukdo'>충청북도</option>
		  <option value='jeollanamdo'>전라남도</option>
		  <option value='jeollabukdo'>전라북도</option>
		  <option value='gyeongsangnamdo'>경상남도</option>
		  <option value='gyeongsangbukdo'>경상북도</option>
		  <option value='jejudo'>제주특별자치도</option>
		</select>
	</div>
</div>
</form>

<div class="matching-button">
	<input type="button" name="goMatching" value="매칭하기">
</div>

</body>
</html>