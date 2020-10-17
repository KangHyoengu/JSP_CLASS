<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cnt" value='<%= (Integer)request.getAttribute("update") %>'/>
<c:set var="uid" value='<%= request.getParameter("uid") %>'/>

<c:if test="${cnt == 0 }">
<script>
	alert("수정 실패");
	history.back();
</script>
</c:if>

<c:if test="${cnt != 0 }">
<script>
	alert("수정 성공");
	location.href = "view.do?uid="+${ uid };
</script>
</c:if>