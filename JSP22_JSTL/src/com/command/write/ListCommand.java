package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.*;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO[] arr = null;
		
		try {
			//트랜젝션 수행 
			arr = dao.select();
			
			//list란 이름으로 request에 arr값 저장
			//즉, request에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			// 만약 ConnectionPool 을 사용한다면 
			// ↑ 여기서 NamingException 도 catch 해야 한다
			e.printStackTrace();
		}
	}

}
