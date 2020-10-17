package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDTO[] dto = null;
		WriteDAO dao = new WriteDAO();
		
		//입력한 값 받아오기
		String id = request.getParameter("uid");
		int uid = 0;
		
		if(id != null && !id.trim().equals("")) {
			uid = Integer.parseInt(id);
		}
		
		//유효성 체크
		try {
			dto = dao.selectById(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("view", dto);
	}
}
