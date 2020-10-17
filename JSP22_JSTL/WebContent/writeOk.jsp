<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cnt" value='<%= (Integer)request.getAttribute("result") %>'/>
<c:if test="${cnt == 0 }">
	<script type="text/javascript">
		alert("등록 실패!!!!!");
		history.back(); //브라우저가 기억하는 직전 페이지
	</script>
</c:if>

<c:if test="${ cnt != 0 }">
	<script>
		alert("등록 성공. 리스트를 출력합니다.");
		location.href = "list.do";
	</script>
</c:if>