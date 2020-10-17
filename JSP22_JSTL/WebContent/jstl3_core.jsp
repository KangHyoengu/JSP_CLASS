<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*" %>

<%-- JSTL core 라이브러리 포함 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSTL Core3</title>
</head>
<style>
table, th, td {
	border: 1px solid #000;
	border-collapse: collapse;
}
</style>
<body>
<h2>if</h2>
<!-- 스크립트릿만 사용하는 경우 1 -->
<%
	if(1 + 2 == 3){
%>
		1 + 2 = 3<br>
<% } %>

<!-- 스크립트릿만 사용하는 경우 2 -->
<%
	if(1 + 2 == 3){
		out.println("1 + 2 = 3 <br>");
	}
%>

<!-- JSTL 사용하는 경우 -->
<c:if test="${ 1 + 2 == 3 }"> <%-- EL 조건식 사용 --%>
	1 + 2 = 3 : EL식 사용 가능<br>
</c:if>

<c:if test="true"> <%-- 항상 참 --%>
	true<br>
</c:if>

<c:if test="<%= 1 + 2 == 3 %>">
	1 + 2 = 3 : JSP 표현식 사용 가능<br>
</c:if>

<c:if test="${ 1 + 2 != 3 }">
	1 + 2 != 3<br>
</c:if>

<hr>

<%-- JSTL에선 c:else는 따로없고, 아래와 같이 choose, when을 조합해서 사용한다. --%>
<h2>choose, when, otherwise</h2>

<!-- 스크립트릿만 사용하는 경우 -->
<%
	switch(10 % 2){
		case 0:
%>
			짝수입니다.<br>
<%
			break;
		case 1:
%>
			홀수입니다.<br>
<%
			break;
		default:
%>
			이도 저도 아닙니다.<br>
<%
	}
%>

<!-- JSTL을 사용하는 경우 -->
<c:choose>
	<c:when test="${ 10 % 2 == 0 }">
		짝수입니다.<br>
	</c:when>
	<c:when test="${ 10 % 2 ==1 }">
		홀수입니다.<br>
	</c:when>
	<c:otherwise>
		이도 저도 아닙니다.<br>
	</c:otherwise>
</c:choose>

<hr>
<h2>forEach</h2>
<!-- 스크립트만 사용하는 경우 -->
<%
	for(int i = 0; i <= 30; i += 3){
%>
	<span> <%= i %> </span>
<% } %>

<br>

<!-- JSTL을 사용하는 경우 -->
<c:forEach var="i" begin="0" end="30" step="3">
	<span>${i } </span>
</c:forEach>

<!-- 구구단 3단 -->
<ul>
<c:forEach var="i" begin="1" end="9" step="1">
	<li>3 * ${i } = ${ 3 * i }</li>
</c:forEach>
</ul>

<br>

<c:set var="intArray" value="<%= new int[]{1, 2, 3, 4, 5} %>" />
<c:forEach var="element" items="${intArray }">
	${ element },
</c:forEach>
<br>

<!-- intArray 배열인덱스 2 ~ 4번째 값 출력 -->
<c:forEach var="element" items="intArray" begin="2" end="4">
	${element }, 
</c:forEach>
<br>

<!-- varStatus -->
<c:forEach var="element" items="${intArray }" begin="2" end="4" varStatus="status">
<%--
	varStatus.count : 순환 # 1 ~
	varStatus.index : 인덱스값 begin ~ end
 --%>
	${status.count } : intArray[${status.index }] = ${element }<br>
</c:forEach>
<br>

<%
	List<String> myList = new ArrayList<String>();
	myList.add("일");
	myList.add("월");
	myList.add("화");
%>

<c:set var="arr1" value="<%= myList %>"/>
<c:set var="arr2" value='<%= new String[] {"SUN", "MON", "TUE"} %>'/>

<ul>
	<c:forEach var="element" items="${ arr1 }" varStatus="status">
		<li>${ status.index } : ${element } - ${arr2[status.index] }</li>
	</c:forEach>
</ul>
<br>

<%-- 위의 예를 index만 사용해서 할 수 있다. function 라이브러리 사용 --%>
arr1의 길이 : ${fn:length(arr1) }<br>

<c:set var="cnt" value="${fn:length(arr1) }"/>
<ul>
	<c:forEach var="i" begin="0" end="${cnt - 1 }" varStatus="status">
		<li>${status.index } : ${arr1[status.index] } - ${arr2[status.index] }</li>
	</c:forEach>
</ul>
<br>

<%
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("name", "홍길동");
	map.put("age", 33);
	map.put("today", new java.util.Date()); //오늘날짜
%>

<c:set var="map1" value="<%= map %>"/>

<table>
	<tr><th>key</th><th>value</th></tr>
	<c:forEach var="item" items="${map1 }">
		<tr>
			<td>${item.key }</td>
			<td>${item.value }</td>
		</tr>
	</c:forEach>
</table>
<br>


</body>
</html>