<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//remvoeAttribute('name')
	session.removeAttribute("num1");
%>

<script>
	alert("세션 삭제");
	location.href = "sessionList.jsp";
</script>