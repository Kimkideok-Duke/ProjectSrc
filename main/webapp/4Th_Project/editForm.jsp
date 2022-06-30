<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "board.*"%>
<%@page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>수정하기</h3>
<form action="edit.jsp" method="post">
	<input type="hidden" name="num" value="${vo.num}"> <!-- 안보이지만 수정되는 글에 값을 줌 -->
	<input type="text" name="title" placeholder="제목" value="${vo.title}" required><br>
	<input type="text" name="writer" placeholder="작성자" value="${vo.writer}" required disabled><br> <!-- 작성자는 수정 불가능하게 비활성화 -->
	<textarea rows="4" cols="20" name="content" placeholder="내용">${vo.content}</textarea><br>
	<input type="submit" value="수정">
</form>
</body>
</html>