<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:useBean id="vo" class="board.BoardVo"/>
	<jsp:useBean id="dao" class="board.BoardDao"/>
	<jsp:setProperty name="vo" property="*"/>
<%
	dao.update(vo);
	pageContext.setAttribute("vo", vo);
%>

<c:redirect url="boardDetail.jsp?num=${vo.num}"/> <!-- 화면 보여주기용이 아니라 redirect처리 -->