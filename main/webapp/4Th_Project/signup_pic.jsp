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
.imagelabel{
	display: none;
}
</style>
<script type="text/javascript">
	// 이미지 한장 업로드 유효성 검사
	function check(){
		var file1Obj  = document.querySelector("[name=file1]");
		if(file1Obj.value==""){
			alert("이미지를 업로드해주세요")
			file1Obj.focus();
			return;
		}else{
			location.href="signup_interest.jsp"
		}	
	}
</script>
<%
	String file1 = request.getParameter("file1"); if(file1==null) file1="";
%>
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
		<h2 align="center">사진을 업로드 해 주세요.</h2>
		<%-- 첨부된 이미지 클릭으로 이미지 파일업로드 (이미지파일만) --%> 
    	<input type=file name='file1' accept="image/*" style='display: none;'> 
		<img src="./image_uplod.png" width = 200px height = 200px 
		onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'> 
    	
  	
    	<input class=nextform type="button" value="등록하기" onclick="check()">
    </form>	
</div>
</body>
</html>