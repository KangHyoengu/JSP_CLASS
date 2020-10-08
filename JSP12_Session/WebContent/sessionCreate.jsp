<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String sessionName1 = "num1";
	String sessionValue1 = "" + (int) (Math.random() * 10);
	
	//세션에 name-value 작성
	//setAttribute(String, Object)
	session.setAttribute(sessionName1, sessionValue1);
	
	session.setAttribute("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
%>

<script>
	alert("세션 생성");
	location.href = "sessionList.jsp";
</script>