<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.lec.beans.*" %>
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO"/>
<%--
	Update 의 경우가 의외로 처리 할 것들이 많다.
	
	일단, 기존의 데이터를 불러 들어 와야 한다. SELECT
	그리고, 편집가능한 영역과 그렇지 않은 영역을 분리해서 사용자에게 form 을 제공해야 한다.
	표시내용은 view.jsp 에서 비슷하게 시작가능
	
	나중에 updateOk.jsp 로 넘겨서 실제 UPDATE 쿼리를 실행하기 위해선 uid 값도 넘어가야 한다.
	그래서 넘겨 받은 id 값을 hidden 으로 담아 두었다가 넘겨준다.
	
 --%>

<%  // parameter 받아오기
	int uid = Integer.parseInt(request.getParameter("uid"));
%>

<%
	WriteDTO[] arr = dao.selectById(uid);
%>

<%
	if(arr == null || arr.length == 0){	
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다.");
				//history.back();
			</script>
<%
			return; //더이상 JSP 프로세실 하지 않고 종료
		}
%>
<%
	String name = arr[0].getName();
	String subject = arr[0].getSubject();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int viewcnt = arr[0].getViewCnt();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 수정</title>
<!-- title에 글제목 넣기 -->
</head>
<script>
	//form 검증
	//작성자와 제목은 필수
	function chkSubmit(){
		frm = document.forms['frm'];
		
		var name = frm['name'].value.trim();
		var subject = frm['subject'].value.trim();
		
		if(subject == ""){
			alert("제목란은 반드시 입력해야 합니다.");
			frm["subject"].focus();
			return false;
		}
		
		return true;
	}	
</script>
<body>
	<form name="frm" action="updateOk.jsp" method="post"
		onsubmit="return chkSubmit()">
		<input type="hidden" name="uid" value="<%= uid%>"> 작성자:
		<%=name%><br>
		<%-- 작성자 이름은 변경 불가 --%>
		제목: <input type="text" name="subject" value="<%=subject%>" /><br>
		내용<br>
		<textarea name="content"><%=content%></textarea>

		<br> <br> <input type="submit" value="수정" />
		<button type="button" onclick="history.back()">이전으로</button>
		<button type="button" onclick="location.href='list.jsp'">목록보기</button>
		<br>
	</form>
</body>
</html>