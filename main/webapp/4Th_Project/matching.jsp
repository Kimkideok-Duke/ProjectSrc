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
// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
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
		상대방 나이 <select name='age'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='49'>49세</option>
		  <option value='48'>48세</option>
		  <option value='47'>47세</option>
		  <option value='46'>46세</option>
		  <option value='45'>45세</option>
		  <option value='44'>44세</option>
		  <option value='43'>43세</option>
		  <option value='42'>42세</option>
		  <option value='41'>41세</option>
		  <option value='40'>40세</option>
		  <option value='39'>39세</option>
		  <option value='38'>38세</option>
		  <option value='37'>37세</option>
		  <option value='36'>36세</option>
		  <option value='35'>35세</option>
		  <option value='34'>34세</option>
		  <option value='33'>33세</option>
		  <option value='32'>32세</option>
		  <option value='31'>31세</option>
		  <option value='30'>30세</option>
		  <option value='29'>29세</option>
		  <option value='28'>28세</option>
		  <option value='27'>27세</option>
		  <option value='26'>26세</option>
		  <option value='25'>25세</option>
		  <option value='24'>24세</option>
		  <option value='23'>23세</option>
		  <option value='22'>22세</option>
		  <option value='21'>21세</option>
		  <option value='20'>20세</option>
		</select>
	</div> ~
	
	<div class="age-dropdown2">
		<select name='age'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='49'>49세</option>
		  <option value='48'>48세</option>
		  <option value='47'>47세</option>
		  <option value='46'>46세</option>
		  <option value='45'>45세</option>
		  <option value='44'>44세</option>
		  <option value='43'>43세</option>
		  <option value='42'>42세</option>
		  <option value='41'>41세</option>
		  <option value='40'>40세</option>
		  <option value='39'>39세</option>
		  <option value='38'>38세</option>
		  <option value='37'>37세</option>
		  <option value='36'>36세</option>
		  <option value='35'>35세</option>
		  <option value='34'>34세</option>
		  <option value='33'>33세</option>
		  <option value='32'>32세</option>
		  <option value='31'>31세</option>
		  <option value='30'>30세</option>
		  <option value='29'>29세</option>
		  <option value='28'>28세</option>
		  <option value='27'>27세</option>
		  <option value='26'>26세</option>
		  <option value='25'>25세</option>
		  <option value='24'>24세</option>
		  <option value='23'>23세</option>
		  <option value='22'>22세</option>
		  <option value='21'>21세</option>
		  <option value='20'>20세</option>
		</select>
	</div>
</div>
<%if(matLoc!=null && matLoc.equals("selectloc")){%>
  <div class="row">
    <div class="col-25">
      <label for="loc"></label>
    </div>
	<div class="loc-checkbox">
		서울특별시 <input type="radio" name="loc" value="서울특별시" checked="checked">
		경기도 <input type="radio" name="loc" value="경기도">
		인천광역시 <input type="radio" name="loc" value="인천광역시">
		부산광역시 <input type="radio" name="loc" value="부산광역시">
		대구광역시 <input type="radio" name="loc" value="대구광역시"><br>
		광주광역시 <input type="radio" name="loc" value="광주광역시">
		대전광역시 <input type="radio" name="loc" value="대전광역시">
		울산광역시 <input type="radio" name="loc" value="울산광역시">
		세종특별자치시 <input type="radio" name="loc" value="세종특별자치시">
		강원도 <input type="radio" name="loc" value="강원도"><br>
		충청남도 <input type="radio" name="loc" value="충청남도">
		충청북도 <input type="radio" name="loc" value="충청북도">
		전라남도 <input type="radio" name="loc" value="전라남도">
		전라북도 <input type="radio" name="loc" value="전라북도"><br>
		경상남도 <input type="radio" name="loc" value="경상남도">
		경상북도 <input type="radio" name="loc" value="경상북도">
		제주특별자치도 <input type="radio" name="loc" value="제주특별자치도">
	</div>
  </div>
  <%}else{
	Users001 u = dao.getUserList(userno);%>
	<input type="hidden" name="loc" value="<%= u.getLoc()%>"/>
  <%}%>
  <div class="matching-button">
    <input type="button" value="선택" onclick="pass()">
  </div>
  </form>
</div>
<script>
function pass(){
		var ageS = document.querySelectorAll("[name=age]");
		if (ageS[0].value=="" || ageS[1].value=="")
		{
			alert("나이를 선택해야 합니다.")
			return;
		}
		if(ageS[0].value>ageS[1].value){
			alert("나이를 제대로 입력하세요");
			return;
		}
		document.querySelector("form").submit();
    }
</script>
</body>
</html>