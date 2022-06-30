<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.*" %>
<%@page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:useBean id="n" class="notice.Notice"/>
	<jsp:useBean id="dao" class="notice.NoticeDAO"/>
	<jsp:setProperty name="n" property="*"/>
<%
	dao.update(n);
	pageContext.setAttribute("n", n);
%>

<c:redirect url="notice_Detail.jsp?noticeno=${n.noticeno}"/> <!-- 화면 보여주기용이 아니라 redirect처리 -->