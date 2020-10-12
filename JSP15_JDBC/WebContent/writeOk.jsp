<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JDBC관련 클래스 import -->
<%@ page import="java.sql.*" %>

<%
	//한글 인코딩 post 받아올때 꼭!
	request.setCharacterEncoding("UTF-8");

	//입력한 값 받아오기
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	//유효성 체크
	if((name == null || subject == null || name.trim().equals("") || subject.trim().equals(""))){
%>
<script>
	alert("작성자이름, 글제목을 입력하세요.");
	history.back(); //사용자가 마지막으로 입력한 내용까지 기억하는 write.jsp로 돌아감
</script>
<%		
		return; //더이상 JSP 프로세싱 하지 않도록 여기서 종료
	}
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

<%! 
	//쿼리문 준비
	//ex) String sql_xxxx = "INSERT INTO ..."
	final String SQL_WRITE_INSERT = "INSERT INTO test_write"+
		"(wr_uid, wr_subject, wr_content, wr_name)"+
		"VALUES(test_write_seq.nextval, ?, ?, ?)";
%>

<%
	try{
		Class.forName(DRIVER);
		out.print("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공"+"<br>");
		
		//트랜젝션 수행
		pstmt = conn.prepareStatement(SQL_WRITE_INSERT);
		
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setString(3, name);
		
		cnt = pstmt.executeUpdate(); //정상적으로 INSERT되면 1이 리턴됨
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

<% if(cnt == 0){ %>
	<script type="text/javascript">
		alert("등록 실패!!!!!");
		history.back(); //브라우저가 기억하는 직전 페이지
	</script>
<% } else { %>
	<script>
		alert("등록 성공. 리스트를 출력합니다.");
		location.href = "list.jsp";
	</script>
<% }%>