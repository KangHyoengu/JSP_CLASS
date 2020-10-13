<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JDBC관련 클래스 import -->
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

<%!
	//JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //executeQuery() SELECT 결과
	
	int cnt = 0; //executeUpdate(), DML 결과
	
	
	//Connetion에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver"; //JDBC드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; //DB 접속 URL
	final String USERID = "scott08a";
	final String USERPW = "tiger08a";
%> 

<%!//쿼리문 준비
	final String SQL_WRITE_INC_VIEWCNT = 
			"UPDATE test_write SET wr_viewcnt = wr_viewcnt + 1 where wr_uid = ?";
	final String SQL_WRITE_SELECT_BY_UID = 
			"SELECT * FROM test_write WHERE wr_uid = ?";
%>
<%
	String name = "";
	String subject = "";
	String content = "";
	String regdate = "";
	int viewcnt = 0;
%>
<%
	try{
		Class.forName(DRIVER);
		out.print("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공"+"<br>");
		
		//트랜젝션 수행
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT_BY_UID);
		pstmt.setInt(1, uid);
		rs = pstmt.executeQuery();
		
		//한개의 레코드만 select 된다.
		if (rs.next()) {
			subject = rs.getString("wr_subject");
			content = rs.getString("wr_content");
		
			if (content == null) {
				content = ""; //null 처리
			}
			name = rs.getString("wr_name");
			viewcnt = rs.getInt("wr_viewcnt");
			Date d = rs.getDate("wr_regdate");
			Time t = rs.getTime("wr_regdate");
		
			if (d != null) {
				regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("HH:mm:ss").format(t);
			}
		} else {
			//wr_uid 값의 레코드가 없는 뜻
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다.");
				//history.back();
			</script>
<%
			return; //더이상 JSP 프로세실 하지 않고 종료
		}
	} catch(Exception e){
		e.printStackTrace();
	}finally{
		//DB리소스 해제
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
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