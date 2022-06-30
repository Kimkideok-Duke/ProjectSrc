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
	int num = Integer.parseInt(request.getParameter("num"));
%>
<form action="delete.jsp?num=<%=num %>" >
<input type="hidden" value="<%=num %>" name="num">
삭제 하시겠습니까?<input type="submit" value="예">
</form>
</body>
</html>