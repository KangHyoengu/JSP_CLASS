<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<!-- Action Tag -->
	<p>지금 현재 페이지는 include페이지 입니다.</p>
	<jsp:include page="sub.jsp"/>
	<p>위 라인의 내용은 sub페이지의 내용입니다.</p>
	
	<!-- include 지시자 vs include page -->
	<hr>
	<!-- include directive -->
	<p>지금 현재 페이지는 include 페이지 입니다.</p>
	<%@ include file="sub.jsp" %>
	<p>위 라인의 내용은 sub페이지의 내용입니다.</p>
	
	<hr>
	<%!
		//변수 선언
		String name = "홍길동";
		int age = 33;
	%>
	<%@ include file="sub2.jsp" %>
	성별 : <%= gender %><br>
</body>
</html>