<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="arr" value='<%= (WriteDTO[])request.getAttribute("list") %>'/>

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
		<c:if test="${arr != null }">
			<c:forEach var="element" items="${arr }" varStatus="status">
				<tr>
					<td>${element.uid }</td>
					<td><a href="view.do?uid=${element.uid }">${element.subject }</a></td>
					<td>${element.name }</td>
					<td>${element.viewCnt }</td>
					<td>${element.regDate }</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
	<br>
	<button onclick="location.href = 'write.do'">신규등록</button>
</body>
</html>