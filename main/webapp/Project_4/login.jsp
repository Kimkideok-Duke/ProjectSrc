<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<style>
.body{
	font-family: "Noto Sans KR", sans-serif;
}
.login-icon{
	position: absolute;
	left: 535px;
	top: 100px;
	width: 60%;
}

.login-icon1{
	position: absolute;
	bottom: 225px;
	left: 470px;
	color: rgb(220,220,220);
}
.login-icon2{
	position: absolute;
	bottom: 165px;
	left: 470px;
	color: rgb(220,220,220);
}

#login{
	position: absolute;
	margin: 330px 0 0 500px;
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
	padding: 460px 0 280px 570px;
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
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"></head>
<body>



<div class="login-icon">
	<img src="VV.png">
</div>

 
<div class="login-icon1">
<span class="material-icons">person</span>
</div>
<div class="login-icon2">
<span class="material-icons">vpn_key</span>
</div>

<div id="login">
	<form class="form" action="main.jsp">
		<div class="login-input">
		<input class="inputsize" type="text" name="id" size="15" placeholder="Username"/><br><br>
		<input class="inputsize" type="password" name="pass" size="15" placeholder="Password"/><br>
		</div>
		<div class="login-button" >
			<input class="login-submit" type="button" value="LOGIN" style="WIDTH: 90px; HEIGHT: 36px" onclick="Login()"/>
		</div>

	</form>
</div>	
	<div class="join">
		<input class="join-button" type="button" value="JOIN" style="WIDTH: 120px; HEIGHT: 26px"/>

	</div>
	
</body>
</html>