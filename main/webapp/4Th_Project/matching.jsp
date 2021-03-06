<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.*"
	import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>matching</title>
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

.matching1{
	position: absolute;
	left: 560px;
	top: 220px;
}

.loc-radio{
	position: absolute;
	left: 530px;
	top: 340px;
}
.loc-checkbox{
	position: absolute;
	text-align: center;
	left: 365px;
	top: 350px;
	background-color: rgba(250, 80, 120, 0.2);
	padding: 5px;
	border: none;
	border-radius: 10px;
}

.age-dropdown1{
	display: inline-block;
}

.age-dropdown2{
	display: inline-block;
}

.age-dropdown{
	position: absolute;
	left: 510px;
	top: 430px;
	z-index: 10;
}

.matching-button{
	position: absolute;
	left: 480px;
	top: 460px;
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
<%
// ?????? ???????????? ???????????? ??? ????????? ?????? ??????????????? ??????
String id = null;
if(session.getAttribute("id") != null){
	id = (String)session.getAttribute("id");
}
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
			<li><a href="main.jsp">???</a></li>
			<li><a href="matchingLoc.jsp">????????????</a></li>
			<li><a href="profile.jsp">???????????????</a></li>
			<li><a href="list.jsp">???????????????</a></li>
			<li><a href="notice_list.jsp">????????????</a></li>
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


<div class="matching1">
	<img src="matching1.JPG">
</div>
<%
String matLoc = request.getParameter("matLoc");

PreDAO dao = new PreDAO();
%>
<div class="container">
  <form action="matchingProcess.jsp">
  <div class="age-dropdown">
	<div class="age-dropdown1">
		????????? ?????? <select name='age'>
		  <option value='' selected>-- ?????? --</option>
		  <option value='49'>49???</option>
		  <option value='48'>48???</option>
		  <option value='47'>47???</option>
		  <option value='46'>46???</option>
		  <option value='45'>45???</option>
		  <option value='44'>44???</option>
		  <option value='43'>43???</option>
		  <option value='42'>42???</option>
		  <option value='41'>41???</option>
		  <option value='40'>40???</option>
		  <option value='39'>39???</option>
		  <option value='38'>38???</option>
		  <option value='37'>37???</option>
		  <option value='36'>36???</option>
		  <option value='35'>35???</option>
		  <option value='34'>34???</option>
		  <option value='33'>33???</option>
		  <option value='32'>32???</option>
		  <option value='31'>31???</option>
		  <option value='30'>30???</option>
		  <option value='29'>29???</option>
		  <option value='28'>28???</option>
		  <option value='27'>27???</option>
		  <option value='26'>26???</option>
		  <option value='25'>25???</option>
		  <option value='24'>24???</option>
		  <option value='23'>23???</option>
		  <option value='22'>22???</option>
		  <option value='21'>21???</option>
		  <option value='20'>20???</option>
		</select>
	</div> ~
	
	<div class="age-dropdown2">
		<select name='age'>
		  <option value='' selected>-- ?????? --</option>
		  <option value='49'>49???</option>
		  <option value='48'>48???</option>
		  <option value='47'>47???</option>
		  <option value='46'>46???</option>
		  <option value='45'>45???</option>
		  <option value='44'>44???</option>
		  <option value='43'>43???</option>
		  <option value='42'>42???</option>
		  <option value='41'>41???</option>
		  <option value='40'>40???</option>
		  <option value='39'>39???</option>
		  <option value='38'>38???</option>
		  <option value='37'>37???</option>
		  <option value='36'>36???</option>
		  <option value='35'>35???</option>
		  <option value='34'>34???</option>
		  <option value='33'>33???</option>
		  <option value='32'>32???</option>
		  <option value='31'>31???</option>
		  <option value='30'>30???</option>
		  <option value='29'>29???</option>
		  <option value='28'>28???</option>
		  <option value='27'>27???</option>
		  <option value='26'>26???</option>
		  <option value='25'>25???</option>
		  <option value='24'>24???</option>
		  <option value='23'>23???</option>
		  <option value='22'>22???</option>
		  <option value='21'>21???</option>
		  <option value='20'>20???</option>
		</select>
	</div>
</div>
<%if(matLoc!=null && matLoc.equals("selectloc")){%>
  <div class="row">
    <div class="col-25">
      <label for="loc"></label>
    </div>
	<div class="loc-checkbox">
		??????????????? <input type="radio" name="loc" value="???????????????" checked="checked">
		????????? <input type="radio" name="loc" value="?????????">
		??????????????? <input type="radio" name="loc" value="???????????????">
		??????????????? <input type="radio" name="loc" value="???????????????">
		??????????????? <input type="radio" name="loc" value="???????????????"><br>
		??????????????? <input type="radio" name="loc" value="???????????????">
		??????????????? <input type="radio" name="loc" value="???????????????">
		??????????????? <input type="radio" name="loc" value="???????????????">
		????????????????????? <input type="radio" name="loc" value="?????????????????????">
		????????? <input type="radio" name="loc" value="?????????"><br>
		???????????? <input type="radio" name="loc" value="????????????">
		???????????? <input type="radio" name="loc" value="????????????">
		???????????? <input type="radio" name="loc" value="????????????">
		???????????? <input type="radio" name="loc" value="????????????"><br>
		???????????? <input type="radio" name="loc" value="????????????">
		???????????? <input type="radio" name="loc" value="????????????">
		????????????????????? <input type="radio" name="loc" value="?????????????????????">
	</div>
  </div>
  <%}else{
	Users001 u = dao.getUserList(userno);%>
	<input type="hidden" name="loc" value="<%= u.getLoc()%>"/>
  <%}%>
  <div class="matching-button">
    <input type="button" value="??????" onclick="pass()">
  </div>
  </form>
</div>
<script>
function pass(){
		var ageS = document.querySelectorAll("[name=age]");
		if (ageS[0].value=="" || ageS[1].value=="")
		{
			alert("????????? ???????????? ?????????.")
			return;
		}
		if(ageS[0].value>ageS[1].value){
			alert("????????? ????????? ???????????????");
			return;
		}
		document.querySelector("form").submit();
    }
</script>
</body>
</html>