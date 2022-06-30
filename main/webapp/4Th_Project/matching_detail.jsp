<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.*"
	import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
PreDAO dao = new PreDAO();
%>
<jsp:useBean id="mat" class="db.Users001" scope="session"/>
    <table>
    	<tr><th>닉네임</th><td><%=mat.getNickname()%></td></tr>
    	<tr><th>나이</th><td><%=mat.getAge()%></td></tr>
    	<tr><th>사는곳</th><td><%=mat.getLoc()%></td></tr>
    	<tr><th>관심사1</th><td><%=mat.getInterest1()%></td></tr>
    	<tr><th>관심사2</th><td><%=mat.getInterest2()%></td></tr>
    	<tr><th>관심사3</th><td><%=mat.getInterest3()%></td></tr>
    	<tr><th>관심사4</th><td><%=mat.getInterest4()%></td></tr>
    	<tr><th>관심사5</th><td><%=mat.getInterest5()%></td></tr>
    </table>
</body>
</html>