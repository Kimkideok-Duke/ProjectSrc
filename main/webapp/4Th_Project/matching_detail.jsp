<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.*"
	import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.matching1{
	position: absolute;
	left: 560px;
	top: 180px;
}

.loc-radio{
	position: absolute;
	left: 530px;
	top: 340px;
}
.loc-checkbox{
	position: absolute;
	text-align: center;
	left: 360px;
	top: 380px;
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
	left: 500px;
	top: 500px;
	z-index: 10;
}

.matching-button{
	position: absolute;
	left: 470px;
	top: 480px;
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

.match-table,td{
	border: 1px solid rgb(220,220,220);
 	border-collapse: collapse;
}
.match-table{
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

@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div id="header">
	<div class="banner" onclick="location.href='main.jsp'">
		<img
			src="VV.png" href="main.jsp">
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
		<span class="material-icons">account_circle</span>
	</div>
	<div class="search">
		<input class="serach-button" type="text" name="search" placeholder="search" />
		<span class="material-icons">search</span>
	</div>
</div>
<div id="guard"></div>
<body>
<%
PreDAO dao = new PreDAO();
String userno = request.getParameter("userno");
if(userno==null) userno="";
Users001 userInfo = dao.getUserList(userno);
%>
    <table class="match-table">
    	<tr><td>닉네임</td><td><%=userInfo.getNickname()%></td></tr>
    	<tr><td>성별</td><td><%=userInfo.getGender()%></td></tr>
    	<tr><td>나이</td><td><%=userInfo.getAge()%></td></tr>
    	<tr><td>사는곳</td><td><%=userInfo.getLoc()%></td></tr>
    	<tr><td>관심사1</td><td><%=userInfo.getInterest1()%></td></tr>
    	<tr><td>관심사2</td><td><%=userInfo.getInterest2()%></td></tr>
    	<tr><td>관심사3</td><td><%=userInfo.getInterest3()%></td></tr>
    	<tr><td>관심사4</td><td><%=userInfo.getInterest4()%></td></tr>
    	<tr><td>관심사5</td><td><%=userInfo.getInterest5()%></td></tr>
    </table>
	<div class="matching-button">
    	<input type="button" value="좋아요" onclick="location.href='result_mat.jsp?userno='+'<%=userno%>'">
  	</div>
</body>
</html>