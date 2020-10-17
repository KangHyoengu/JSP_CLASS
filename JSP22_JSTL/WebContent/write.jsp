<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script>
	//form 검증
	//작성자와 제목은 필수
	function chkSubmit(){
		frm = document.forms['frm'];
		
		var name = frm['name'].value.trim();
		var subject = frm['subject'].value.trim();
		
		if(name == ""){
			alert("작성자 란은 반드시 입력해야 합니다.");
			frm["name"].focus();
			return false;
		}
		
		if(subject == ""){
			alert("제목란은 반드시 입력해야 합니다.");
			frm["subject"].focus();
			return false;
		}
		
		return true;
	}	
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글작성</h2>
	
	<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
	<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">
		작성자: <input type="text" name="name" /><br> 
		제목: <input type="text" name="subject" /><br> 
		내용:<br><textarea name="content"></textarea><br>
		
		<br> <input type="submit" value="등록" />
	</form>
	<br>
	<button type="button" onclick="location.href='list.do'">목록으로</button>
</body>
</html>