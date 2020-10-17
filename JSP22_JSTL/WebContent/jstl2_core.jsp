<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL core 라이브러리 포함 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSTL Core 2</title>
</head>
<body>
<h2>set, remove, out</h2>

이름: <c:out value="jang"/><br>
<c:set var="name" value="홍길동"/>
이름: <c:out value='${ name }'/><br> <%-- JSTL의 변수는 EL에서 사용 가능 --%>
${name }<br>

<c:remove var="name" />
이름: <c:out value='${ name }'/><br>

<hr>
<%
	int age = 10;
%>
나이: <%= age %><br>
나이: ${ age }<br> <%-- Java변수는 EL에서 사용 불가 --%>
<c:set var="age" value="<%= age %>"/>
나이: ${ age }<br> <%-- Java -> JSTL -> EL --%>
<hr>

<h2>catch</h2>
<c:catch var="error">
	<!-- 이 안에서 예외 발생하면 예외 객체를 error변수에 담는다. -->
	계산결과: <%= 2/0 %><br>
</c:catch>
<br>
<c:out value='${ error }'/> <!-- java.lang.ArithmeticException: / by zero -->
<br>

<c:catch var="ex">
name parameter 값 = <%= request.getParameter("name") %><br>
<%
	if(request.getParameter("name").equals("test")){
%>
		${ param.name }은 test입니다.
<%
	}
%>
</c:catch>

예외발생<br>
${ ex }

</body>
</html>