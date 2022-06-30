<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.*" %>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="dao" class="notice.NoticeDAO"/>
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	dao.delete(noticeno);
%>

<c:redirect url="list.jsp"/> 