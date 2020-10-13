<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JDBC관련 클래스 import -->
<%@ page import="java.sql.*" %>

<%
	//parameter값 받아오기
	int uid = Integer.parseInt(request.getParameter("uid"));

	int curPage = 1;  // 현재 페이지 (디폴트는 1 page)
	
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
			out.println("에러");
		}
	}
%>
<%!
	//JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //executeQuery() SELECT 결과
	
	int cnt = 0;
	
	//Connetion에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver"; //JDBC드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; //DB 접속 URL
	final String USERID = "scott08a";
	final String USERPW = "tiger08a";
%> 

<%! 
	//쿼리문 준비
	final String SQL_WRITE_DELETE_BY_UID = "DELETE FROM test_write WHERE wr_uid = ?"; 
%>

<%
	try{
		Class.forName(DRIVER);
		out.print("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공"+"<br>");
		
		//트랜젝션 수행
		pstmt = conn.prepareStatement(SQL_WRITE_DELETE_BY_UID);
		
		pstmt.setInt(1, uid);
		
		cnt = pstmt.executeUpdate();
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
<% if(cnt == 0) { %>
<script>
	alert("삭제 실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("삭제성공");
	location.href = "list.jsp?page=<%= curPage%>";
</script>
<% } %>