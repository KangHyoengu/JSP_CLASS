<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>param2</title>
</head>
<body>
	<!-- Action Tag -->
	<p>지금 현재 페이지는 param2 페이지 입니다.</p>

	<%
		int num = 788;
	%>

	<jsp:include page="subParam.jsp">
		<jsp:param value="test123" name="id" />
		<jsp:param value="<%=num%>" name="pw" />
	</jsp:include>

	<p>위 라인의 내용은 subParam 페이지의 내용입니다.</p>
</body>
</html>