<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.*"
	import="db.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
PreDAO dao = new PreDAO();
String userno_m = request.getParameter("userno");
if(userno_m==null) userno_m="";
String userno_u = (String)session.getAttribute("userno");
Users001 user = dao.getUserList(userno_u);
String gender_u = user.getGender();
if(gender_u.equals("M")){
    dao.setResultMat(new Result_Match(userno_u, userno_m, "Y",""));
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('좋아요를 보냈습니다!')");
    script.println("location.href='main.jsp'");
    script.println("</script>");
}else{
    dao.setResultMat(new Result_Match(userno_m, userno_u, "","Y"));
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('좋아요를 보냈습니다!')");
    script.println("location.href='main.jsp'");
    script.println("</script>");
}
%>
</body>
</html>