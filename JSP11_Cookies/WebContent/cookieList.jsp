<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>cookie 리스트</title>
</head>
<body>
	<%
		//클라이언트 안의 쿠키정보는 매 request 마다 서버로 전달된다.
		//request.getCookies()로 쿠키 객체를 꺼내온다.
		
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null && cookies.length > 0){ //쿠키가 하나라도 있다면
			for(int i = 0; i < cookies.length; i++){
				String cookieName = cookies[i].getName(); //쿠키 '이름'
				String cookieValue = cookies[i].getValue();
				
				out.println((i + 1) + "]" + cookieName + " : " + cookieValue + "<br>");
			}
		} else {
			out.println("쿠키가 없습니다.<br>");
		}
	
	%>

	<br>
	<form action="cookieCreate.jsp" method="get">
		<input type="submit" value="쿠키생성&갱신">
	</form>
	
	<br>
	<form action="cookieDelete.jsp" method="get">
		<input type="submit" value="쿠키삭제">
	</form>
	
</body>
</html>