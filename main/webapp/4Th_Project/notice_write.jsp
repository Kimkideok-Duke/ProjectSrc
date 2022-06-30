<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="signupcss.css">
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
textarea {
  width: 550px;
  height: 400px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  resize: none;
}
</style>
</head>
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
<div class="divm">
<h1 align="center">공지사항</h1><br>
<form align="center">
제목 <input class="inputtext" type="text"><br><br>
<textarea name="content" onkeyup="ckText()" placeholder="내용을 입력해주세요."></textarea>
<span id="shTxtCnt">0/1000</span>
<input class="nextform" type="button" value="저장하기" onclick="save()">
</form>
<script>
	// 글쓰기 하단에 글자수 표시
  	function ckText(){
  		var ctObj = document.querySelector("[name=content]");
  		var txtLen = ctObj.value.length;
  		console.log(txtLen)
  		var shCntObj = document.querySelector("#shTxtCnt");
  		shCntObj.innerText = txtLen+"/1000";
  		if(txtLen>=1 && txtLen<=1000){
  			shCntObj.style.color="blue";
  		}else{
  			shCntObj.style.color="red";
  		}
  	}
  	function save(){
  		var ctObj = document.querySelector("[name=content]");
  		var txtLen = ctObj.value.length;
  		if(txtLen>=1 && txtLen<=1000){
  			alert("저장되었습니다")
  			location.href="notice_list.jsp"
  			return;
  		}else{
  			alert("1자 이상 1000자 이하로 작성해주세요.")
  			return;
  		}
  		
  	}
  </script>

</div>
</body>
</html>