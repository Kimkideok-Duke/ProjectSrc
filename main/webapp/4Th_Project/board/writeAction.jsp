<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.*"%>	
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.BoardVo" scope="session"/>
<jsp:useBean id="board" class="board.BoardDao" scope="session"/>
<jsp:setProperty name="bbs" property="*"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>Insert title here</title>
</head>
<body>

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
	}else{
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BoardDao boardDAO = new BoardDao();
			int result = boardDAO.write(dao.getTitle(), id, boardDAO.getContent());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 등록되었습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		}
	}
%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>