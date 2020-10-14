<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.lec.beans.WriteDTO" />
<jsp:setProperty property="*" name="dto" />

<%
	int cnt = dao.insert(dto);
%>

<% if(cnt == 0){ %>
	<script type="text/javascript">
		alert("등록 실패!!!!!");
		history.back(); //브라우저가 기억하는 직전 페이지
	</script>
<% } else { %>
	<script>
		alert("등록 성공. 리스트를 출력합니다.");
		location.href = "list.jsp";
	</script>
<% }%>