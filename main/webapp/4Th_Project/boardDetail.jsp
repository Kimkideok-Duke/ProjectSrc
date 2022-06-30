<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "board.*"
    %>
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
<title>글 내용</title>
</head>
<body>

<%
// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
String id = null;
if(session.getAttribute("id") != null){
	id = (String)session.getAttribute("id");
}
String userno = (String)session.getAttribute("userno");
if(userno==null) userno = "";
%>
<h3>글정보</h3>
<p>번호:${vo.num}</p>
<p>제목:${vo.title}</p>
<p>작성자:${vo.writer}</p>
<p>내용:${vo.content}</p>
<p>작성일자:${vo.regdate}</p>
<p>조회수:${vo.cnt}</p>

<a href="<c:url value="editForm.jsp?num=${vo.num}"/>"><button>수정</button></a>
<a href="<c:url value="deleteForm.jsp?num=${vo.num}"/>"><button>삭제</button></a>


<div id="board">
	<h2>글 작성</h2>
	<form method="post" action="writeAction.jsp">
	<table class="board-table">
		<tr class="table-text"><td>제목</td><td colspan="3"><input type="text" name="bbsTitle" size=98 maxlength=30></td></tr>
		<tr class="contents"><td>내용</td><td colspan="3"><textarea cols="100" rows="20" name="bbsContent"></textarea></td></tr>
	</table>
	<input class="insert" type="submit" value="수정" >
	</form>
	<input class="cancel" type="button" value="삭제" onclick="deleteConfirm();">
	
<script>

function deleteConfirm(){
	
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}else{
		location.href="${pageContext.request.contextPath }/board/delete.do?board_idx=${boardContents.board_idx}";
	}
}

</script>
</div>
</body>
</html>