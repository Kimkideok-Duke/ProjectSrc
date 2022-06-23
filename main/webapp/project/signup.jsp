<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
	function goInsertPage(){
		location.href="signup_pic.jsp";
	}
</script>
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
<script>
<%--
	function idcheck(){
		var idObj  = document.querySelector("[name=id]");
		if(idObj.value==""){
			alert("아이디를 입력하세요.")
			idObj.focus();
			return;
		}else if(????){
			alert("이미 사용중인 아이디입니다. 다시 입력해주세요.")
			idObj.focus();
		}else{
			alert("사용가능한 아이디입니다.")
		}
	}
	--%>
	function check(){
		if(confirm("등록하시겠습니까?")){
			var passwordObj  = document.querySelector("[name=password]");
			var passwordchObj  = document.querySelector("[name=passwordch]");
			var nicknameObj  = document.querySelector("[name=nickname]");
			var ageObj  = document.querySelector("[name=age]");
			var genderObj  = document.querySelector("[name=gender]");
			var adressObj  = document.querySelector("[name=adress]");
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
			if(ageObj.value==""){
				alert("나이를 입력하세요.")
				ageObj.focus();
				return;
			}
			if(genderObj.value==""){
				alert("성별을 선택하세요.")
				genderObj.focus();
				return;
			}
			if(adressObj.value==""){
				alert("거주지를 선택하세요.")
				adressObj.focus();
				return;
			}
			
			document.querySelector("form").submit();
		}
		
	}
</script>
<%
	int age=0;
	String ageS = request.getParameter("age");
	if(ageS!=null) age = Integer.parseInt(ageS);
	String id = request.getParameter("id"); if(id==null) id="";
	String password = request.getParameter("password"); if(password==null) password="";
	String passwordch = request.getParameter("passwordch"); if(passwordch==null) passwordch="";
	String nickname = request.getParameter("nickname"); if(nickname==null) nickname="";
	String gender = request.getParameter("gender"); if(gender==null) gender="";
	String adress = request.getParameter("adress"); if(adress==null) adress="";
%>
<div class=divm>
		<h1 align="center">회원가입</h1>
		<form class=loginform action="">
			아이디 <input class=inputtext type="text" name="id">
			<input class=overlap type="button" name="idoverlap" value="중복확인" onclick="idcheck()"><br>
			비밀번호 <input class=inputtext type="password" name="password"><br>
			비밀번호 확인 <input class=inputtext type="password" name="passwordch"><br>
			닉네임 <input class=inputtext type="text" name="nickname"><br>
			나이 <input class=inputtext type="text" name = "age"><br>
			성별 <input type="radio" name="gender" style="font-size:17px; width:23px;height:23px">남자
				<input type="radio" name="gender" style="font-size:17px; width:23px;height:23px">여자<br>
			주소 <select class=inputtext name="adress">
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
