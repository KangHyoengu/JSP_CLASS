<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JDBC관련 클래스 import -->
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	int curPage = 1; //현재페이지
	
	//현재 페이지 파라미터 받아오기
	String pageParam = request.getParameter("page");
	if(pageParam != null && !pageParam.trim().equals("")){
		try{
			int p = Integer.parseInt(pageParam);
			
			if(p > 0){
				curPage = p;
			}
		} catch(NumberFormatException e) {
			// pageParam 에러 처리 
		}
	}
%>

<%!//JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //executeQuery() SELECT 결과

	//Connetion에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver"; //JDBC드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; //DB 접속 URL
	final String USERID = "scott08a";
	final String USERPW = "tiger08a";
%>

<%!//쿼리문 준비
	//ex) String sql_xxxx = "INSERT INTO ..."
	//final String SQL_WRITE_SELECT = "SELECT * FROM test_write ORDER BY wr_uid DESC";
	
	//페이징
	//쿼리 : 글 목록 전체개수 가져오기
	String SQL_COUNT_ALL = "SELECT COUNT(*) FROM test_write";
	
	//쿼리 : fromRow 부터 pageRows 만큼 SELECT
	final String SQL_SELECT_FROM_ROW = "SELECT * FROM "+
					"(SELECT ROWNUM AS RNUM, T.* FROM "+ 
					"(SELECT * FROM TEST_WRITE ORDER BY wr_uid DESC) T) "+
					"WHERE RNUM >= ? AND RNUM < ?";

	int cnt = 0; //글 목록 전체의 개수
	
	int writePages = 10; // 한[페이징]에 몇개의 '페이지'를 표현할 것인가?
	int pageRows = 8; //한 '페이지'에 몇개의 글을 리스트 할 것인가?
	int totalPage = 0; //총 몇'페이지' 분량인가?
%>

<%
		try {
		Class.forName(DRIVER);
		out.print("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공" + "<br>");

		//트랜젝션 수행
		pstmt = conn.prepareStatement(SQL_COUNT_ALL);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			cnt = rs.getInt(1); //전체 개수 구하기
		}
		
		rs.close();
		pstmt.close();
		
		totalPage = (int)Math.ceil(cnt / (double)pageRows); //총 몇페이지 분량인가?
				
		int fromRow = (curPage - 1) * pageRows + 1; // 몇번째 row 부터?
				
		pstmt = conn.prepareStatement(SQL_SELECT_FROM_ROW);
		pstmt.setInt(1, fromRow);
		pstmt.setInt(2, fromRow + pageRows);
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>목록<%= curPage %>페이지</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

</head>
<body>
	<hr>
	<h2>
		리스트
		<%=curPage%>페이지
	</h2>
	<!-- 현재 페이지 표시 -->
	<h4>
		총
		<%=cnt%>개
	</h4>
	<!-- 전체 글 개수 -->
	<table>
		<tr>
			<th>row</th>
			<!-- 줄번호와 -->
			<th>ID</th>
			<!-- wr_id값 출력 -->
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
		<%
		while (rs.next()) {
			out.print("<tr>");
			
			int rnum = rs.getInt("rnum");
			
			int uid = rs.getInt("wr_uid");
			String subject = rs.getString("wr_subject");
			String name = rs.getString("wr_name");
			int viewcnt = rs.getInt("wr_viewcnt");
			Date d = rs.getDate("wr_regdate"); //날짜만 가져옴
			Time t = rs.getTime("wr_regdate");
			String regdate = "";

			if (d != null) {
				regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " + new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			out.println("<td>"+rnum+"</td>");
			out.println("<td>" + uid + "</td>");
			out.println("<td><a href='view.jsp?uid=" + uid + "&page=" + curPage + "'>" + subject + "</a></td>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + viewcnt + "</td>");
			out.println("<td>" + regdate + "</td>");

			out.println("</tr>");
		}
		%>
	</table>
	<br>
	<button onclick="location.href='write.jsp'">신규등록</button>
	<%
		} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//DB리소스 해제
		try {
			if (rs != null)
		rs.close();
			if (stmt != null)
		stmt.close();
			if (pstmt != null)
		pstmt.close();
			if (conn != null)
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	%>
	
	<%--페이징 --%>
	<jsp:include page="pagination.jsp">
		<jsp:param value="<%=writePages%>" name="writePages" />
		<jsp:param value="<%=totalPage%>" name="totalPage" />
		<jsp:param value="<%=curPage%>" name="curPage" />
	</jsp:include>