<%@page import="com.lec.beans.WriteDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="arr" value='<%= (WriteDTO[])request.getAttribute("view") %>'/>
<c:set var="arrLength" value="${fn:length(arr) }"/>

<c:if test="${arr == null || arrLength == 0 }">
	<script>
		alert("해당 정보가 삭제되거나 없습니다");
		history.back();
	</script>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 글 읽기[${arr[0].subject }]</title>  <!-- title에 게시판 제목 넣기~ -->
</head>
<script>
	function chkDelete(uid){
		// 삭제 여부, 다시 확인 하고 진행하기
		var r = confirm("삭제하시겠습니까?🗑");
		if(r){
			location.href = 'deleteOk.do?uid=' + uid;
		}
	}
</script>
<body>
	<h2>읽기 ${arr[0].subject }</h2>
	<br>
	ID : ${arr[0].uid }<br>
	작성자 : ${arr[0].name }<br>
	제목 : ${arr[0].subject }<br>
	등록일 : ${arr[0].regDate }<br>
	조회수 : ${arr[0].viewCnt }<br>
	내용  : <br>
	<hr>
	<div>
		${arr[0].content }
	</div>
	<hr>
	
	<button onclick="location.href='update.do?uid=${arr[0].uid }'">수정하기</button>
	<button onclick="location.href='list.do'">목록보기</button>
	<button onclick="chkDelete(${arr[0].uid })">삭제하기</button>
	<button onclick="location.href='write.do'">신규등록</button>
</body>
</html>
