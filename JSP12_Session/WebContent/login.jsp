<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>

<%

//현재 로그인 상태인지 확인
//attr name이 'userid'인 값이 존재하는지 확인

if (session.getAttribute("userid") == null) {
%>

<h2>로그인 상태가 아닙니다</h2>
<form action="loginOk.jsp">
	id: <input type="text" name="userid"><br> 
	pw: <input type="password" name="pw"><br> 
	<input type="submit" value="로그인" /><br>
</form>

<%
	} else {
%>

<h2>로그인 상태입니다</h2>
<form action="logout.jsp">
	<input type="submit" value="로그아웃" /><br>
</form>

<%
	}
%>