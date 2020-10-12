<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JDBC관련 클래스 import -->
<%@ page import="java.sql.*" %>

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

<%! 
	//쿼리문 준비
	//ex) String sql_xxxx = "INSERT INTO ..."
%>

<%
	try{
		Class.forName(DRIVER);
		out.print("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공"+"<br>");
		
		//트랜젝션 수행
		
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
