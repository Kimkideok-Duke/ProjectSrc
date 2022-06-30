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
}
#header {
   position: fixed;
   top: 0;
   width: 100%;
   z-index: 2;
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
   <div class="banner" href="#">
      <img
         src="V.jpg">
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
	<input class="nextform" type="button" name="join" value="가입하기" onclick="check()">
</form>
</div>
</body>
</html>