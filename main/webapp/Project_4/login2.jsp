<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/sample.css" rel="stylesheet">
<style>


/*
.login-icon{
	position: absolute;
	left: 700px;
	top: 300px;
	height: 110px;
	width: 100px

}
*/
.login-icon1{
	position: absolute;
	bottom: 190px;
	left: 470px;
}
.login-icon2{
	position: absolute;
	bottom: 130px;
	left: 470px;
}

#login{
	position: absolute;
	margin: 260px 0 0 500px;
	border-color: rgb(220,220,220);
	border-radius: 4px;
	border: 1px;
	z-index: 1;
}
#login .inputsize{
	height: 30px;
	text-color: rgb(220,220,220);
}
#login .login-button{
	display: inline-block;
	position: absolute;
	bottom: 28px;
	left: 210px;
}
#login .login-input{
	display: inline-block;
}

#login .login-button .login-submit{
	appearance: none;
	font-family: "Noto Sans KR", sans-serif;
	color: #FFFFFF;
	font-size: 16px;
	padding: 5px 5px;
	cursor: pointer;
	background-color: rgb(250, 80, 120);
	border: none;
	border-radius: 4px;

}

.join{
	position: absolute;
	padding:400px 0 80px 570px;
}
.join-button{
	color: rgb(250, 80, 120);
	background-color: rgb(220,220,220);
	font-size: 16px;
	padding: 5px 5px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
}

@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

</style>
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

<!-- 
<div class="login-icon">
	<img src="VV.png">
</div>
 -->
<div class="login-icon1">
<span class="material-icons">person</span>
</div>
<div class="login-icon2">
<span class="material-icons">vpn_key</span>
</div>

<div id="login">
	<form>
		<div class="login-input">
		<input class="inputsize" type="text" name="id" placeholder="Username"/><br><br>
		<input class="inputsize" type="password" name="pass" placeholder="Password"/><br>
		</div>
		<div class="login-button" >
			<input class="login-submit" type="button" value="LOGIN" style="WIDTH: 90px; HEIGHT: 36px"/>
		</div>
	</form>
</div>	

<div class="join">
<input class="join-button" type="button" value="JOIN" style="WIDTH: 120px; HEIGHT: 26px"/>

</div>

</body>
</html>