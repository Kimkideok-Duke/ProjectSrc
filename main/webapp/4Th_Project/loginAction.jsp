<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>

<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	
	String userno = (String)session.getAttribute("userno");
	if(userno==null) userno = "";
	
	UserDAO userDAO = new UserDAO();
	String result = userDAO.login(user.getId(), user.getPassword());
	String auth = userDAO.getAuth(user.getId(), user.getPassword());
	if(result == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		session.setAttribute("id",user.getId());
		script.println("<script>");
		script.println("alert('로그인 성공!')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		session.setAttribute("userno", result);
		session.setAttribute("auth", auth);
	}
%>

</body>
</html>