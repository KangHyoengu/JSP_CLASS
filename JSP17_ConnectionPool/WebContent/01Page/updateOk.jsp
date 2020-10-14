<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<jsp:useBean id="dao" class="com.lec.beans.WriteDAO" />
<!-- JDBC관련 클래스 import -->
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	int uid = Integer.parseInt(request.getParameter("uid"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
%>

<%
	int cnt = dao.update(uid, subject, content);
%>

<% if(cnt == 0) { %>
<script>
	alert("수정 실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("수정 성공");
	location.href = "view.jsp?uid=<%= uid %>";
</script>
<% } %>