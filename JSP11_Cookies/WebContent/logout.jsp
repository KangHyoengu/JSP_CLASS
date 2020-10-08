<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cookieName = "userid";
	String cookieValue = "";
	
	Cookie cookie = new Cookie(cookieName, cookieValue);
	cookie.setMaxAge(0); //쿠키제거
	response.addCookie(cookie); //response에 쿠키 정보 추가
%>

<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	location.href = "login.jsp";
</script>
