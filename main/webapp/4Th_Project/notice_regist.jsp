<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="notice.*" %>
<%@page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:useBean id="n" class="notice.Notice"/>
<jsp:useBean id="dao" class="notice.NoticeDAO"/>
<jsp:setProperty name="n" property="*"/>
<%
dao.insert(n);
%>
<%
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	
	String userno = (String)session.getAttribute("userno");
	if(userno==null) userno = "";
	
	
	if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
%>
<c:redirect url="notice_list.jsp"/> <!-- 화면 보여주기용이 아니라 redirect처리 -->