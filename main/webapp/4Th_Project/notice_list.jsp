<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="notice.*"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	NoticeDAO dao = new NoticeDAO();
	List<Notice> notiList = dao.showNoticeInfo();
	pageContext.setAttribute("notiList", notiList); // pageContext에 notiList 담아서 사용 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="board.css">
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
.board-table {
	border-collapse: collapse;
	width: 100%;
	margin: 60px 0 0 0;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #DDD;
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
}

th{
	background-color: rgb(220,220,220);
}

td{
	font-size: 12px;
}

.contents:hover {
	background-color: rgba(250, 80, 120, 0.1);
}

#board {
	position: absolute;
	background-color: rgba(250, 80, 120, 0.05);
	width: 80%;
	height: 600px;
	left: 125px;
	padding: 20px 0 100px 0;
	color: rgb(94, 94, 94);
}
#board > h2{
	position: absolute;
	left: 50px;
}
.board-table{
	margin: 100px 0 0 0;
}

.board-write-button{
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
	left: 880px;
	z-index: 1;
	bottom: 645px;
}

.notice-search{
	position: absolute;
	left: 800px;

}

.notice-write-button{
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
	left: 880px;
	z-index: 1;
	bottom: 645px;
}


@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
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
<%
String auth = (String)session.getAttribute("auth");
if(auth==null) auth="";
%>
<script>
function accessDenied(){
	alert("글작성 권한이 없습니다.");
	location.href="notice_list.jsp";
}
</script>
<div id="board">
	<h2>공지사항</h2>
	<table class="board-table">
	<tr>
		<th>No.</th>
		<th>제목</th>
		<th>등록일</th>
		<th>내용</th>
	</tr>
	
	<c:forEach var="board" items="${notiList}">
	<tr class="contents" >
		<td>${notice.noticeno}</td>
		<td>${notice.nttitle}</td>
		<td>${notice.ntdate}</td>
		<td>${notice.ntcontent}</td>
	</tr>
	</c:forEach>
	</table>
	<div class="notice-write">
	<%if(auth!=null&&auth.equals("manager")){%>
	<input class="notice-write-button" type="button" value="글작성" onclick="location.href='notice_registForm.jsp'">
	<%}else {%>
	<input class="board-write-button" type="button" value="글작성" onclick="accessDenied()">
	<%} %>
	</div>
</div>

</body>
</html>