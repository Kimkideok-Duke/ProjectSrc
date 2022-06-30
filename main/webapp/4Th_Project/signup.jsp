<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.PreDAO"
    import="db.*"%>
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
<title>회원가입(개인정보)</title>
<link rel="stylesheet" href="signupcss.css">
<jsp:useBean id="users" class="db.Users001" scope="session"/>

<script>
	var ovl = false;	// 중복확인 검사 통과하면 ovl = true;

	function check(){
		if(confirm("등록하시겠습니까?")){
			var idObj  = document.querySelector("[name=id]");
			var passwordObj  = document.querySelector("[name=password]");
			var passwordchObj  = document.querySelector("[name=passwordch]");
			var nicknameObj  = document.querySelector("[name=nickname]");
			var genderObj  = document.querySelector("[name=gender]");
			var ageObj  = document.querySelector("[name=age]");
			var locObj  = document.querySelector("[name=loc]");

			if(idObj.value==""){
				alert("아이디를 입력하세요.")
				ovl = false;
				idObj.focus();
				return;
			}else if(ovl == false){
				alert("아이디 중복확인을 해주세요.")
				idObj.focus();
				return;
			}
			
			if(passwordObj.value==""){
				alert("비밀번호를 입력하세요.")
				passwordObj.focus();
				return;
			}
			if(passwordObj.value.length<8||passwordObj.value.length>12){
				alert("비밀번호는 8~12자 사이로 입력하세요.")
				passwordObj.focus()
				return;
			}
			if(passwordchObj.value==""){
				alert("비밀번호 확인을 입력하세요.")
				passwordchObj.focus();
				return;
			}
			if(passwordchObj.value!=passwordObj.value){
				alert("비밀번호가 일치하지 않습니다.")
				passwordchObj.focus();
				return;
			}
			if(nicknameObj.value==""){
				alert("닉네임을 입력하세요.")
				nicknameObj.focus();
				return;
			}
			if(document.getElementById('gender_Male').checked) {
				
			}else if(document.getElementById('gender_Female').checked) {
					
			}else{
				alert("성별을 입력하세요.")
				return;
			}
			if(ageObj.value==""){
				alert("나이를 입력하세요.")
				ageObj.focus();
				return;
			}
			if(locObj.value=="현재 거주지를 선택해주세요"){
				alert("거주지를 선택하세요.")
				locObj.focus();
				return;
			}
			document.querySelector("form").submit();
		}
	}

<%
	PreDAO dao = new PreDAO();

	String id = request.getParameter("id"); if(id==null) id="";
	String password = request.getParameter("password"); if(password==null) password="";
	String passwordch = request.getParameter("passwordch"); if(passwordch==null) passwordch="";
	String nickname = request.getParameter("nickname"); if(nickname==null) nickname="";
	String gender = request.getParameter("gender"); if(gender==null) gender="";
	int age = 0;
	String ageS = request.getParameter("age"); if(ageS!=null) age = Integer.parseInt(ageS);
	String loc = request.getParameter("loc"); if(loc==null) loc="";
	
	// 등록 처리를 위한 조건
	String isIns = "N";
	if(id != null && !id.trim().equals("")){
		users.setId(id);
		dao.insertUsers(new Users001(id, password, nickname, gender, age, loc));
		isIns = "Y";
	}
%>	
	
	//ID는 별도로 중복 확인
	function idcheck(){
		var idObj = document.querySelector("[name=id]");
		var idCnt = <%=dao.getOverlapIDCnt(id) %>;
		// ajax를 써야 구현 가능, DB 테이블 제약조건 때문에 중복값은 알아서 입력이 취소되기 때문에 크게 상관 X
		if(idObj.value == ""){
			alert("아이디를 입력하세요.")
			ovl = false;
			idObj.focus();
			return;
		}else if(idCnt != 0){
			alert("이미 사용중인 아이디입니다. 다시 입력해주세요.")
			ovl = false;
			idObj.focus();
			return;
		}else{
			alert("사용가능한 아이디입니다.")
			ovl = true;
		}
	}

	var isIns = "<%=isIns%>";
	if(isIns == "Y"){
		if(confirm("등록성공!!")){
			location.href="signup_interest.jsp"
		}
	}
</script>
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
		<h1 align="center">회원가입</h1>
		<form class=loginform>
			아이디 <input class=inputtext type="text" name="id">
			<input class=overlap type="button" value="중복확인" onclick="idcheck()"/><br>
			비밀번호 <input class=inputtext type="password" name="password"><br>
			비밀번호 확인 <input class=inputtext type="password" name="passwordch"><br>
			닉네임 <input class=inputtext type="text" name="nickname"><br>
			성별 <input type="radio" name="gender" id="gender_Male" style="font-size:17px; width:23px;height:23px" value="M">남자
				<input type="radio" name="gender" id="gender_Female" style="font-size:17px; width:23px;height:23px" value="F">여자<br>
			나이 <input class=inputtext type="text" name = "age"><br>
			주소 <select class=inputtext name="loc">
					<option>현재 거주지를 선택해주세요</option>
					<option>강원도</option>
					<option>경기도</option>
					<option>경상남도</option>
					<option>경상북도</option>
					<option>광주광역시</option>
					<option>대구광역시</option>
					<option>대전광역시</option>
					<option>부산광역시</option>
					<option>서울특별시</option>
					<option>세종특별자치시</option>
					<option>울산광역시</option>
					<option>인천광역시</option>
					<option>전라남도</option>
					<option>전라북도</option>
					<option>제주특별자치도</option>
					<option>충청남도</option>
					<option>충청북도</option>
				</select><br>
			<input class=nextform type="button" value="다음" onclick="check()">
		</form>
</div>
</body>
</html>
