<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Session List</title>
</head>
<body>
	<%
		//session 내부 객체 사용
		//서블릿에서는 request.getSession()으로 세션 객체를 얻어올 수 있다.
	
		String sessionName, sessionValue;
	
		//세션에 있는 모든 attr names들 뽑아내기
		Enumeration<String> enumeration = session.getAttributeNames();
	
		int i = 0;
		while (enumeration.hasMoreElements()) {
			sessionName = enumeration.nextElement();
			//session.getAttribute('name') <-- 특정 세션 attr value 추출. 해당 name이 없으면 null 리턴
			sessionValue = session.getAttribute(sessionName).toString();
			
			out.println((i + 1) + "]" + sessionName + " : " + sessionValue + "<br>");
			i++;
		}
	
		if (i == 0) {
			out.println("세션이 없습니다.<br>");
		}
	%>

	<br>

	<form action="sessionCreate.jsp" method="get">
		<input type="submit" value="세션 생성" />
	</form>

	<form action="sessionDelete.jsp" method="get">
		<input type="submit" value="세션 삭제" />
	</form>

	<br>
	<%
		String sessionId = session.getId();
		int sessionInterval = session.getMaxInactiveInterval(); //세션 존속시간(s)
	
		out.println("세션 ID : " + sessionId + "<br>");
		out.println("세션 유효시간 : " + sessionInterval + "<br>");
	%>
	
	<%
		out.println("---- session.invalidate() 후 ----<br>");
		//session.invalidate(); //세션 무효화
		
		sessionId = session.getId();
		sessionInterval = session.getMaxInactiveInterval(); //세션 존속시간(s)
		
		out.println("세션 ID : " + sessionId + "<br>");
		out.println("세션 유효시간 : " + sessionInterval + "<br>");
	%>
</body>
</html>