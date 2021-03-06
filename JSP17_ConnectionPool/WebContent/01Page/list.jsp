<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO"/> <!-- DAO bean 생성 -->

<%
	// dao를 사용한 트랜잭션
	WriteDTO arr [] = dao.select();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글목록</title>
<style>
	table{width: 100%;}
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>

	<hr>
	<h2>리스트</h2>
	<table>
		<tr>
			<td>ID</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
		</tr>
<%
	if(arr != null){
		for(int i =0; i <arr.length; i++){
%>
	<tr>
		<td><%= arr[i].getUid() %></td>
		<td><a href="view.jsp?uid=<%= arr[i].getUid()%>"><%= arr[i].getSubject() %></a></td>
		<td><%= arr[i].getName() %></td>
		<td><%= arr[i].getViewCnt() %></td>
		<td><%= arr[i].getRegDate() %></td>
	
	</tr>
<% 	 } // end for
 } // end if
%>		
	</table>
	<br>
	<button onclick="location.href = 'write.jsp'">신규등록</button>

</body>
</html>