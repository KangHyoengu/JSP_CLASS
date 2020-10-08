<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>tag & directive</title>
</head>
<body>
<%--
<%
	int sum = 0;
	for(int i = 1; i <= 100; i++){
		sum += i;
	}
%>
1붵 100까지의 합은 <%= sum %>
--%>
<h3>오늘의 식단</h3>
- 비빔밥<br>
- 김치찌개<br>
- 칼국수<br>
<%@ include file = "test.jsp" %>
</body>
</html>