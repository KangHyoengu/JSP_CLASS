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

import common.D;

public class WriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public WriteDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("WriteDAO 생성, 데이터베이스 연결!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	public int insert(WriteDTO dto) throws SQLException{
		String subject = dto.getSubject();
		String content = dto.getContent();
		String name = dto.getName();
		
		int cnt = this.insert(subject, content, name);
		return cnt;
	}
	
	public int insert(String subject, String content, String name) throws SQLException{
		int cnt = 0;
		
		try {
			System.out.println("pstmt "+pstmt);
			System.out.println("conn "+conn);
			System.out.println("D.SQL_WRITE_INSERT "+D.SQL_WRITE_INSERT);
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
	
	public WriteDTO[] select() throws SQLException{
		WriteDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	//특정 id 글 내용 읽기, 조회수 증가
	public WriteDTO[] readById(int uid) throws SQLException{
		int cnt = 0;
		WriteDTO[] arr = null;
		
		try {
			//트랜젝션 처리
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
	public WriteDTO[] selectById(int uid) throws SQLException {
		WriteDTO[] arr = null;

		try {
			// 트랜젝션 처리
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();

			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}
	
	public int update(int uid, String subject, String content) throws SQLException {
		int cnt = 0;
		try {
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
	
	public int deleteByUid(int uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, uid);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
}
