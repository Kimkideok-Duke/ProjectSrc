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
<%
	String interest[] = request.getParameterValues("interest");

	String interest1 = interest[0];
	String interest2 = interest[1];
	String interest3 = interest[2];
	String interest4 = interest[3];
	String interest5 = interest[4];
%>
	function goInsertPage(){
		location.href="signup_agreement.jsp";
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
			alert("최대 5개까지 선택할수 있습니다.")
			obj.checked=false;
			return false;
		}
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
<div class=divm>
	<h1 align="center">회원가입</h1>
<form class = loginform>
	<h2 align="center">관심사를 선택 해 주세요.<br>(최대 5개)</h2>
	<div class="interestdiv">
		<input type="checkbox" name="interest" onclick = "countckbox(this)">그림
		<input type="checkbox" name="interest" onclick = "countckbox(this)">낚시
		<input type="checkbox" name="interest" onclick = "countckbox(this)">독서
		<input type="checkbox" name="interest" onclick = "countckbox(this)">동물<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)">게임
		<input type="checkbox" name="interest" onclick = "countckbox(this)">운동
		<input type="checkbox" name="interest" onclick = "countckbox(this)">옷
		<input type="checkbox" name="interest" onclick = "countckbox(this)">만화<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)">컴퓨터
		<input type="checkbox" name="interest" onclick = "countckbox(this)">스마트폰
		<input type="checkbox" name="interest" onclick = "countckbox(this)">신발
		<input type="checkbox" name="interest" onclick = "countckbox(this)">시계<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)">가방
		<input type="checkbox" name="interest" onclick = "countckbox(this)">향수
		<input type="checkbox" name="interest" onclick = "countckbox(this)">자동차
		<input type="checkbox" name="interest" onclick = "countckbox(this)">오토바이<br>
		<input type="checkbox" name="interest" onclick = "countckbox(this)">카메라
		<input type="checkbox" name="interest" onclick = "countckbox(this)">영화
		<input type="checkbox" name="interest" onclick = "countckbox(this)">커피
		<input type="checkbox" name="interest" onclick = "countckbox(this)">음악<br>
	</div>
	<input class=nextform type="button" value="등록하기" onclick="goInsertPage()">
</form>
</div>
</body>
</html>