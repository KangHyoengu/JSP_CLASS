<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 
`	다음과 같은 일 수행
	Person person1 = new com.lec.beans.Person(); //기본생성자 호출
	request.setAttribute("person1", person1); //좀 더 정확히는 여기까지 수행
 --%>
<jsp:useBean id="person1" class="com.lec.beans.Person" scope="page" />

<%-- 기본생성자 생성후 useBean안에서 setProperty 사용 --%>
<jsp:useBean id="person2" class="com.lec.beans.Person" scope="page">
	<jsp:setProperty name="person2" property="name" value="차운호" />
	<jsp:setProperty name="person2" property="age" value="23" />
	<jsp:setProperty name="person2" property="id" value="88888" />
	<jsp:setProperty name="person2" property="gender" value="여" />
</jsp:useBean>

<%--
	form에서 넘어온 값을 bean객체가 바로 받을 수 있다.
	bean의 필드명 과 form의 name은 일치해야 한다.
 --%>
<jsp:useBean id="person3" class="com.lec.beans.Person" scope="page">
	<%-- person3.setName(request.getParameter("name")); --%>
	<jsp:setProperty name="person3" property="name" />
	<jsp:setProperty name="person3" property="age" />
	<jsp:setProperty name="person3" property="id" />
	<jsp:setProperty name="person3" property="gender" />
</jsp:useBean>

<%-- parameter를 일괄적으로 받아올 수 있다. --%>
<jsp:useBean id="person4" class="com.lec.beans.Person" scope="page"/>
<jsp:setProperty name="person4" property="*"/>

<%@ page import="com.lec.beans.Person" %>
<%
	//Person person1; 에러
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-type" content="text/html charset=UTF-8">
<title>자바빈</title>
</head>
<body>
	<%-- 
	다음과 같은 일을 수행한다
	Person1.setName("고길동");
 --%>
	<jsp:setProperty property="name" name="person1" value="고길동" />
	<jsp:setProperty property="age" name="person1" value="24" />
	<jsp:setProperty property="gender" name="person1" value="남" />
	<jsp:setProperty property="id" name="person1" value="1515" />

	<h3>person1</h3>
	<%-- Person1.getName(); --%>
	이름: <jsp:getProperty property="name" name="person1" /><br> 
	나이: <jsp:getProperty property="age" name="person1" /><br> 
	성별: <jsp:getProperty property="gender" name="person1" /><br> 
	아이디: <jsp:getProperty property="id" name="person1" /><br>

	<h3>person2</h3>
	이름: <jsp:getProperty property="name" name="person2" /><br> 
	나이: <jsp:getProperty property="age" name="person2" /><br> 
	성별: <jsp:getProperty property="gender" name="person2" /><br> 
	아이디: <jsp:getProperty property="id" name="person2" /><br>

	<h3>person3</h3>
	이름: <jsp:getProperty property="name" name="person3" /><br> 
	나이: <jsp:getProperty property="age" name="person3" /><br> 
	성별: <jsp:getProperty property="gender" name="person3" /><br> 
	아이디: <jsp:getProperty property="id" name="person3" /><br>
	
	<h3>person4</h3>
	이름: <jsp:getProperty property="name" name="person4" /><br> 
	나이: <jsp:getProperty property="age" name="person4" /><br> 
	성별: <jsp:getProperty property="gender" name="person4" /><br> 
	아이디: <jsp:getProperty property="id" name="person4" /><br>
	
</body>
</html>