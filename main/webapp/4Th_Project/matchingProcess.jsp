<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="connect.*"
    import="db.*"
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	PreDAO dao = new PreDAO();
	String userno = (String)session.getAttribute("userno");
	Users001 user = dao.getUserList(userno);
	String gender_u = user.getGender();
	String gender_m = "M";					// 매칭 대상 성별
	if(gender_u.equals("M")) gender_m = "F";
	String loc = request.getParameter("loc");
	int age_s, age_e; age_s=age_e=0;
	String[] ageS = request.getParameterValues("age");
	age_s = Integer.parseInt(ageS[0]);	// 범위 시작 나이
	age_e = Integer.parseInt(ageS[1]);	// 범위 끝 나이
    ArrayList<Users001> ulist = dao.matching(gender_m, loc, age_s, age_e);
    String page01="";
    session.removeAttribute("matchlist");
    if(ulist.size()>0){
        ArrayList<Users001> mlist = new ArrayList<Users001>();
        if(gender_u.equals("M")){       // 사용자가 남자일때
            for(int i=0;i<ulist.size();i++){
                String userno_m = ulist.get(i).getUserno(); 
                String cho = dao.getResultMatch(new Result_Match(userno, userno_m)).getChoiceMF();
                if(cho == null) cho = "";
                if(cho.trim().equals("")){
                    mlist.add(ulist.get(i));
                    session.setAttribute("matchlist", mlist);
                    page01="matchingSuccess.jsp";
                }else{
                    page01="matchingFail.jsp";
                }
            }
        }else if(gender_u.equals("F")){ // 사용자가 여자일때
            for(int i=0;i<ulist.size();i++){
                String userno_m = ulist.get(i).getUserno(); 
                String cho = dao.getResultMatch(new Result_Match(userno_m, userno)).getChoiceFM();
                if(cho == null) cho = "";
                if(cho.trim().equals("")){
                    mlist.add(ulist.get(i));
                    session.setAttribute("matchlist", mlist);
                    page01="matchingSuccess.jsp";
                }else{
                    page01="matchingFail.jsp";
                }
            }
        }
    }else{
        page01="matchingFail.jsp";
    }
%>
<%if(!page01.equals("")){%>
    <jsp:forward page="<%=page01%>"/>
<%}%>
</body>
</html>