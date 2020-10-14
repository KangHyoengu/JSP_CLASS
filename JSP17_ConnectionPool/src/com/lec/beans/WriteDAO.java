package com.lec.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.D;

public class WriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public WriteDAO() {}
	
	// ConnectionPool 에서 준비된 Connection 을 가져오기 
		public static Connection getConnection() throws NamingException, SQLException {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/testDB");
			
			// 위 두줄은 다음과 같이 한줄로 작성 가능
			//DataSource ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/testDB");
			
			return ds.getConnection();
		} // end getConnection(); 

	
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	public int insert(WriteDTO dto) throws SQLException, NamingException{
		String subject = dto.getSubject();
		String content = dto.getContent();
		String name = dto.getName();
		
		int cnt = this.insert(subject, content, name);
		return cnt;
	}
	
	public int insert(String subject, String content, String name) throws SQLException, NamingException{
		int cnt = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, name);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public WriteDTO[] createArray(ResultSet rs) throws SQLException{
		WriteDTO[] arr = null;
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			int uid = rs.getInt("wr_uid");
			String subject = rs.getString("wr_subject");
			String content = rs.getString("wr_content");
			
			if(content == null) {
				content = "";
			}
			String name = rs.getString("wr_name");
			int viewCnt = rs.getInt("wr_viewcnt");
			
			Date d = rs.getDate("wr_regdate");
			Time t = rs.getTime("wr_regdate");
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("HH:mm:ss").format(t);
			}
			WriteDTO dto = new WriteDTO(uid, subject, content, name, viewCnt);
			dto.setRegDate(regDate);
			list.add(dto);
		}
		int size = list.size();
		
		if(size == 0) return null;
		arr = new WriteDTO[size];
		list.toArray(arr);
		
		return arr;
	}
	
	public WriteDTO[] select() throws SQLException, NamingException{
		WriteDTO[] arr = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	//특정 id 글 내용 읽기, 조회수 증가
	public WriteDTO[] readById(int uid) throws SQLException, NamingException{
		int cnt = 0;
		WriteDTO[] arr = null;
		
		try {
			//트랜젝션 처리
			conn = getConnection();
			
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}
		
		return arr;
	}
	
	// 특정 id 글만 select
	public WriteDTO[] selectById(int uid) throws SQLException, NamingException {
		WriteDTO[] arr = null;

		try {
			// 트랜젝션 처리
			conn = getConnection();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();

			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}
	
	public int update(int uid, String subject, String content) throws SQLException, NamingException {
		int cnt = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, uid);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public int deleteByUid(int uid) throws SQLException, NamingException {
		int cnt = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
}
