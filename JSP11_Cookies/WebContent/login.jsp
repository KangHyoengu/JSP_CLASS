<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	int i = 0;
%>

<%
	//userid란 이름의 쿠키가 발급되어 있으면 로그인 상태!
	Cookie[] cookies = request.getCookies();
	String cookieName = "userid";
	
	if(cookies != null && cookies.length > 0){
		for(i = 0; i < cookies.length; i++){
			if(cookieName.equals(cookies[i].getName())){
				break; //로그인 상태 확인
			}
		}
	}
%>

<% if(cookies == null || i == cookies.length){ %>	
	<h2>로그인 상태가 아닙니다</h2>
	<form action="loginOk.jsp">
		id: <input type="text" name="userid"><br>
		pw: <input type="password" name="pw"><br>
		<input type="submit" value="로그인"/><br>
	</form>	
<% } else { %>
	<h2>로그인 상태입니다</h2>
	<form action="logout.jsp">
		<input type="submit" value="로그아웃"/><br>
	</form>	
<% } %>