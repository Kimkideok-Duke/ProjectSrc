<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.*"
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
<link rel="stylesheet" href="signupcss.css">
<title>profile</title>
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

.profile-photo{
	position: absolute;
	font-size: 120px;
	left: 575px;
	bottom: 270px;
}

.add-photo{
	position: absolute;
	left: 680px;
	bottom: 260px;
	cursor: pointer;
}
table {
  border-collapse:collapse;
  border:none;
  width : 300px;
  height: 125px;
  margin : auto;
  width:700px
}
 th, td {
    border: none;
     padding: 10px;
 }
 th{
 background-color: #F8C0E5;
 }
#sform {
          text-align: center;
}
.nextform{
	background-Color:#FF98A3;
	border: 3px solid #FFD5D2;
	text-align: center;
	margin:auto;
	width : 80px;
	font-size: 12px;
}
.nextform:hover{
	background-Color:#FF848F;
}
input {
  width:500px;
  height:40px;
  font-size:15px;
}

@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
</style>
<script src="https://kit.fontawesome.com/99c434d4a4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
 <script>
 PreDAO dao = new PreDAO();
  function uptDept(){
		if(confirm("?????????????????????????")){
			document.querySelector("[name=proc]").value="upt";
			document.querySelector("form").submit();
		}
	}
  function delDept(){
		if(confirm("?????????????????????????")){
			document.querySelector("[name=proc]").value="del";
			document.querySelector("form").submit();
		}
	}
  function gomain(){
		if(confirm("?????????????????? ?????????????????????????")){
			location.href"a01_DeptSchList.jsp";
		}
	}
  </script>
  <%    
  %>
<body>

<div id="header">
	<div class="banner" onclick="location.href='main.jsp'">
		<img
			src="VV.png" href="main.jsp">
	</div><!--
 --><div class="navigationbar">
		<ul>
			<li><a href="main.jsp">???</a></li>
			<li><a href="matching.jsp">????????????</a></li>
			<li><a href="profile.jsp">???????????????</a></li>
			<li><a href="board.jsp">???????????????</a></li>
			<li><a href="project/notice_list.jsp">????????????</a></li>
		</ul>
	</div>
	<div class="user-icon">
		<span class="material-icons">account_circle</span>
	</div>
</div>
<div id="guard"></div>


<%
	// ????????? ????????????
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	
   String proc = request.getParameter("proc");
   if(proc == null) proc = "";

   Users001 u = new Users001();
  

   if(id!=null&&!id.trim().equals("")){
		PreDAO dao = new PreDAO();
         // ?????? ??????
         if(proc.equals("upt")){
            int age=0;
            String uid = request.getParameter("uid"); if(uid == null) uid = "";
            String nickname = request.getParameter("nickname"); if(nickname == null) nickname = "";
            String loc = request.getParameter("loc"); if(loc == null) loc = "";
            String interest1 = request.getParameter("interest1"); if(interest1 == null) interest1 = "";
            String interest2 = request.getParameter("interest2"); if(interest2 == null) interest2 = "";
            String interest3 = request.getParameter("interest3"); if(interest3 == null) interest3 = "";
            String interest4 = request.getParameter("interest4"); if(interest4 == null) interest4 = "";
            String interest5 = request.getParameter("interest5"); if(interest5 == null) interest5 = "";
            
            // ?????? ????????? ?????? ?????? ???????????? ??????
            u = new Users001(uid,nickname,loc,interest1,interest2,interest3,interest4,interest5);
            dao.updateProfile(u); // ?????? ??????
         }
      // ????????? ?????? ??????
       u = dao.showProfile(id);
      
  }

%>
<script type="text/javascript">
   var proc = "<%=proc%>";
   if(proc != null && proc.trim() != ""){
      if(proc == "upt"){
         if(confirm("??????????????? ???????????????\n?????????????????? ?????????????????????????")){
            location.href="main.jsp";
         }
      }
   }
</script>

<h1 style="text-align : center;">?????????</h1>
<div class="container">
  <form method="post">
  <table style="align : center;">
  	<tr>
        <th><label for="userno">????????????</label></th>
        <td><input type="text" id="userno" name="userno" placeholder="???????????? ??????.." value="<%=u.getUserno()%>"/></td>
    </tr>
	<tr>  
        <th><label for="uid">?????????</label></th>
        <td><input type="text" id="uid" name="uid" placeholder="????????? ??????.." value="<%=u.getId()%>"/></td>
    </tr>
    <tr>     
        <th><label for="password">????????????</label></th>
        <td><input type="password" id="password" name="password" placeholder="???????????? ??????.." value="<%=u.getPassword()%>"/></td>
    </tr> 
    <tr>     
        <th><label for="nickname">?????????</label></th>
        <td><input type="text" id="nickname" name="nickname" placeholder="????????? ??????.." value="<%=u.getNickname()%>"/></td>
    </tr>
    <tr>   
        <th><label for="gender">??????</label></th>
        <td><input type="text" id="gender" name="gender" placeholder="?????? ??????.." value="<%=u.getGender()%>"/></td>
    </tr>
    <tr>    
        <th><label for="age">??????</label></th>
        <td><input type="text" id="age" name="age" placeholder="?????? ??????.." value="<%=u.getAge()%>"/></td>
    </tr>
    <tr>   
        <th><label for="loc">?????????</label></th>
        <td><input type="text" id="loc" name="loc" placeholder="????????? ??????.." value="<%=u.getLoc()%>"/></td>
    </tr>
    <tr>   
        <th><label for="interest1">?????????1</label></th>
        <td><input type="text" id="interest1" name="interest1" placeholder="????????? ??????.." value="<%=u.getInterest1()%>"/></td>
    </tr>  
    <tr>  
        <th><label for="interest2">?????????2</label></th>
        <td><input type="text" id="interest2" name="interest2" placeholder="????????? ??????.." value="<%=u.getInterest2()%>"/></td>
    </tr>
    <tr>    
        <th><label for="interest3">?????????3</label></th>
        <td><input type="text" id="interest3" name="interest3" placeholder="????????? ??????.." value="<%=u.getInterest3()%>"/></td>
    </tr>
    <tr>    
        <th><label for="interest4">?????????4</label></th>
        <td><input type="text" id="interest4" name="interest4" placeholder="????????? ??????.." value="<%=u.getInterest4()%>"/></td>
    </tr>
    <tr>    
        <th><label for="interest5">?????????5</label></th>
        <td><input type="text" id="interest5" name="interest5" placeholder="????????? ??????.." value="<%=u.getInterest5()%>"/></td>
    </tr>
  </table>  
    <div>
      	<input type="button" value="??????" onclick="uptEmp()" class="nextform">
      	<input type="button" value="??????" onclick="gomain()" class="nextform">
    </div>
      <input type = "hidden" name="proc"/>
  </form>
</div>
<script>
   function uptEmp(){
      if(confirm("?????????????????????????")){
         document.querySelector("[name=proc]").value="upt";
         document.querySelector("form").submit();
       }
   }
  function gomain(){
     location.href="main.jsp";
  }
</script>
</body>

</html>