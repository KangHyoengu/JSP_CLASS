<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<jsp:useBean id="dao" class="com.lec.beans.WriteDAO" />
<%
	//parameter값 받아오기
	int uid = Integer.parseInt(request.getParameter("uid"));
%>
<%
	int cnt = dao.deleteByUid(uid);
%>
<% if(cnt == 0) { %>
<script>
	alert("삭제 실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("삭제성공");
	location.href = "list.jsp";
</script>
<% } %>