<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

첫 JSP 파일! 반갑습니다.

<br>
<%	//JSP 태그영역, server쪽에서 먼저 처리가 됨.
	for(int i = 0; i < 10; i++){
		//out.println() 은 HTML에 출력한다
		out.println("out.println() 출력 " + i + "<br>");
	}
%>

<%
	for(int j = 10; j < 20; j++){
		System.out.println("System.out.println() 풀력 " + j);
	}
%>

</body>
</html>