<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.PreDAO"
    import="db.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String proc = request.getParameter("proc");
	if(proc==null) proc="";
	PreDAO dao = new PreDAO();
	FAQ f = new FAQ();
	String faqno = request.getParameter("faqno"); if(faqno==null) faqno="";
	String question = request.getParameter("question"); if(question==null) question="";
	String answer = request.getParameter("answer"); if(answer==null) answer="";
	String faqdate = request.getParameter("faqdate"); if(faqdate==null) faqdate="";
		if(proc.equals("upt")){
			f= new FAQ(faqno,question,answer);
			dao.updateFaq(f);
			}
	f= dao.getFAQDetail(faqno);
%>
<script>
	var proc="<%=proc%>";
	if(proc!=""){
		if(proc=="upt"){
			if(confirm("수정하였습니다\n리스트로 이동하시겠습니까?")){
				location.href="FAQ_list.jsp";
			}
		}
	}
	function uptDept(){
		if(confirm("수정하시겠습니까?")){
			document.querySelector("[name=proc]").value="upt";
			document.querySelector("form").submit();
		}
	}
  function delDept(){
		if(confirm("삭제하시겠습니까?")){
			document.querySelector("[name=proc]").value="del";
			document.querySelector("form").submit();
		}
	}
  function golist(){
		if(confirm("리스트로 이동하시겠습니까?")){
			location.href"FAQ_list.jsp";
		}
	}
</script>
<form>
<table>
<tr><td>질문</td><td><%=f.getQuestion() %></td><td>작성일자</td><td><%=f.getFaqdate() %></td></tr>
<tr><td>답변</td><td><%=f.getAnswer()%></td></tr>
</table>
    <input type="button" onclick="uptDept()" value="수정">
    <input type="button" onclick="delDept()" value="삭제">
    <input type="button" onclick="golist()" value="리스트">
</form>
</body>
</html>