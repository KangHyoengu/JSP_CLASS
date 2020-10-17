package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		//입력한 값 받아오기
		String id = request.getParameter("uid");
		int uid = 0;
		
		if(id != null && !id.trim().equals("")) {
			uid = Integer.parseInt(id);
		}
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//유효성 체크
		if(subject != null && !subject.trim().equals("")) {
			try {
				cnt = dao.update(uid, subject, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("update", cnt);
	}

}
