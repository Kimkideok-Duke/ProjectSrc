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
<%	
	
	String nickname= request.getParameter("nickname"); if(nickname==null) nickname="";
	String gender = request.getParameter("gender"); if(gender==null) gender="";
	String loc = request.getParameter("loc"); if(loc==null) loc="";
	int age=0;
	String ageS = request.getParameter("age");
	if(ageS!=null) age = Integer.parseInt(ageS);

%>
<body>
<%
PreDAO dao = new PreDAO();


%>
<script type="text/javascript">
	function partnerDetail(nickname){
		location.href="matching_detail.jsp?nickname="+nickname;
	}
</script>
<table>
<
	<tr><th>이름</th><th>성별</th><th>지역</th><th>나이</th></tr>
	<tr ondblclick="partnerDetail(<%=dao.getNickname() %>)"><td><%=dao.getNickname() %></td><td><%=dao.getGender() %></td>
	<td><%=dao.getLoc() %></td><td><%=dao.getAge() %></td></tr>
</table>
</body>
</html>