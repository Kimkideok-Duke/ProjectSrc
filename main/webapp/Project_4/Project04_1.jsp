<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{margin: 0; color: rgb(94, 94, 94);}
	.banner{ text-align:center;  margin: 20px 0;}
	.banner>img{width: 250px;}
	.contents-slider{background-color:#ffaaaa; height: 300px;}
	
	.contents-slider .slick-arrow{
	display: block;
	position: absolute;
	left: 95%;
	top: 50%;
	z-index: 1;
	padding: 10px;
	}
	

</style>

</head>
<body>
	<div class="banner" >
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgwi2dedcVKQW34MCqGgGd6PZwpcI8g28pmA&usqp=CAU">
	</div>
	
	<div>
	<ul>
  <li><a href="#">매칭하기</a></li>
  <li><a href="#">마이프로필</a></li>
  <li><a href="#">커뮤니티</a></li>
  <li><a href="#">이벤트</a></li>
    </ul>
    </div>
	
	<div class="contents-slider">
        
          <div class="post">1</div>
          <div class="post">2</div>
          <div class="post">3</div>
          <div class="post">4</div>
          <div class="post">5</div>
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<script>
		$( document ).ready( function() {
		$('.contents-slider').slick({
		  dots: true,
		  autoplay : true, 
		  arrows : true,
		  infinite: true,
		  speed: 600,
		  slidesToShow: 1,
		  adaptiveHeight: true
		});
		});
	</script>

</body>
</html>