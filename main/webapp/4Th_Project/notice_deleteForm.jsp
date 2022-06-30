<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String noticeno = request.getParameter("noticeno");
%>
<form action="notice_delete.jsp?noticeno=<%=noticeno %>" >
<input type="hidden" value="<%=noticeno %>" name="num">
<h3>삭제 하시겠습니까?</h3><input type="submit" value="예">
</form>
</body>
</html>