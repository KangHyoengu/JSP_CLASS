<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! 
	public static final String ADMIN_ID = "admin";
	public static final String ADMIN_PW = "1234";
%>

<% 
	String id = request.getParameter("userid");
	String pw = request.getParameter("pw");
	
	String sessionName = "userid";
	String sessionValue = id;
	
	if(ADMIN_ID.equalsIgnoreCase(id) && ADMIN_PW.equals(pw)){
		out.println("<script>");
		out.println("alert('로그인 성공!')");
		out.println("</script>");
		
		session.setAttribute(sessionName, sessionValue);
	} else{
		out.println("<script>");
		out.println("alert('로그인 실패!')");
		out.println("</script>");
		
		//혹시 있으면 세션 attr 삭제
		session.removeAttribute(sessionName);
	}
%>

<script>
	location.href = "login.jsp";
</script>