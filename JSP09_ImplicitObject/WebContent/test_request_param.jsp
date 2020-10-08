<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>request parameter</title>
</head>
<body>
<%!
	String data1, data2;
	String name, id, pw, gender, local, memo;
	
	String[] hobbys;
%>
<%
	request.setCharacterEncoding("UTF-8");

	String data1 = request.getParameter("data1");
	String data2 = request.getParameter("data2");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String[] hobbys = request.getParameterValues("hobby");
	
	String gender = request.getParameter("gender");
	String local = request.getParameter("local");
	String memo = request.getParameter("memo");
%>

hidden : <%= data1 %>, <%= data1 %><br>
이름 : <%= name %><br>
아이디 : <%= id %><br>
비밀번호 : <%= pw %><br>
성별 : <%= gender %><br>
취미 : <%= Arrays.toString(hobbys) %><br>
지역 : <%= local %><br>
메모 : <%= memo %><br>
</body>
</html>