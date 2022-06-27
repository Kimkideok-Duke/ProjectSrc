<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입2</title>
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
<%--
	function showImage() {
	    var newImage = document.getElementById('image-show').lastElementChild;
	    newImage.style.visibility = "visible";
	    
	    document.getElementById('image-upload').style.visibility = 'hidden';

	    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
	}


	function loadFile(input) {
	    var file = input.files[0];

	    var name = document.getElementById('fileName');
	    name.textContent = file.name;

	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.width = "70%";
	    newImage.style.height = "70%";
	    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
	    newImage.style.objectFit = "contain";

	    var container = document.getElementById('image-show');
	    container.appendChild(newImage);
	};
--%>
	function loadFile(input) {
	    var file = input.files[0];	//선택된 파일 가져오기

	  	//새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.width = "70%";
	    newImage.style.height = "70%";
	    newImage.style.visibility = "visible";
		empty.style.width = "0";
		empty.style.height = "0";
		uploadtext.style.visibility = "hidden";

	    //이미지를 image-show div에 추가
	    var container = document.getElementById('image-show');
	    container.appendChild(newImage);
	};

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


<div class="divm">
	<h1 align="center">회원가입</h1>
	<form class=loginform method="post" enctype="multipart/form-data">
		<h2 align="center" id="uploadtext">사진을 업로드 해 주세요.</h2>
		<div class="image-show" id="image-show"></div>
			<label for="chooseFile">
				<img src="./image_uplod.png" id="empty" width="100" height="100"/><br>
			</label>
		<input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
		<input class="nextform" type="button" value="등록하기" onclick="goInsertPage()">
	</form>
</div>

</body>
</html>


