<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//특정 cookie를 삭제하기(특정 이름의 쿠키 삭제하기)

Cookie[] cookies = request.getCookies();
String cookieName = "id"; //id란 이름의 쿠키를 삭제하려고 한다.

if (cookies != null && cookies.length > 0) {
	for (int i = 0; i < cookies.length; i++) {
		if (cookieName.equals(cookies[i].getName())) {
	cookies[i].setMaxAge(0); //expiry를 0으로 하면
	response.addCookie(cookies[i]); //response 후 곧바로 삭제
		}
	}
}
%>
<script>
	alert("<%=cookieName%> 쿠키삭제");
	location.href = "cookieList.jsp";
</script>