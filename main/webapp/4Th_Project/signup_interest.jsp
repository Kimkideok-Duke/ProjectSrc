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
<title>회원가입(관심사)</title>
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

<script type="text/javascript">
	function check(){
		if(confirm("등록하시겠습니까?")){
			var chkBox = document.getElementsByName("interest");
			var chkBoxCnt = 0;
			for(var cnt = 0; cnt < chkBox.length; cnt++){
				if(chkBox[cnt].checked){
					chkBoxCnt++;
				}
			}
			if(chkBoxCnt < 5){
				alert("관심사를 5개 선택해야합니다!")
			}
			if(chkBoxCnt == 5){
				document.querySelector("form").submit();
			}
		}
	}
	
	function countckbox(obj){
		var chkBox = document.getElementsByName("interest");
		var chkBoxCnt=0;
		for(var cnt=0; cnt<chkBox.length; cnt++){
			if(chkBox[cnt].checked){
				chkBoxCnt++;
			}
		}
		if(chkBoxCnt>5){
			alert("관심사는 5개까지만 선택할 수 있습니다.")
			obj.checked=false;
			return false;
		}
	}
	<%
	String id = users.getId();
	
	PreDAO dao = new PreDAO();
	String interest[] = request.getParameterValues("interest");
	String isIns = "N";
	if(interest != null && interest[4] != null){
		dao.updateUsersInterest(new Users001(interest[0], interest[1], interest[2], interest[3], interest[4], id));
		isIns = "Y";
	}
%>
	var isIns = "<%=isIns%>";
	if(isIns == "Y"){
		if(confirm("가입 완료!!")){
			location.href="main.jsp"
		}
	}

</script>

<div id="header">
   <div class="banner" href="#">
      <img src="V.jpg">
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
	<h1 align="center">회원가입</h1>
<form class = loginform>
	<h2 align="center">관심사를 선택 해 주세요.<br>(5개)</h2>
	<div class="interestdiv">
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="그림" />그림
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="낚시"/>낚시
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="독서"/>독서
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="동물"/>동물<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="게임"/>게임
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="운동"/>운동
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="옷"/>옷
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="만화"/>만화<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="컴퓨터"/>컴퓨터
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="스마트폰"/>스마트폰
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="신발"/>신발
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="시계"/>시계<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="가방"/>가방
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="향수"/>향수
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="자동차"/>자동차
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="오토바이"/>오토바이<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="카메라"/>카메라
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="영화"/>영화
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="커피"/>커피
		<input type="checkbox" name="interest" onclick = "countckbox(this)" value="음악"/>음악<br>
	</div>
		<input class=nextform type="button" value="다음" onclick="check()">
</form>

<h2>세션 ID : <%=id %></h2>
		
</div>
</body>
</html>