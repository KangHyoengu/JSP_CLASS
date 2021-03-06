package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletFrom
 */
@WebServlet("/FormOk")
public class ServletFrom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletFrom() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//post방식 request처리시 꼭! (한글데이터)
		request.setCharacterEncoding("UTF-8");
		
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String[] hobbys = request.getParameterValues("hobby");
		
		String gender = request.getParameter("gender");
		String local = request.getParameter("local");
		String memo = request.getParameter("memo");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("hidden: " + data1 + ", " + data2 + "<br>");
		out.println("이름: " + name + "<br>");
		out.println("아이디: " + id + "<br>");
		out.println("비밀번호: " + pw + "<br>");

		out.println("취미: " + Arrays.toString(hobbys) + "<br>");
		out.println("성별: " + gender + "<br>");
		out.println("지역: " + local + "<br>");
		out.println("메모: " + memo + "<br>");

		out.close();
		
		System.out.println("getParameterNames() 사용");
		Enumeration<String> names = request.getParameterNames();
		
		while(names.hasMoreElements()) {
			String param_name = names.nextElement();
			String param_value = request.getParameter(param_name);
			System.out.println(param_name + " : " + param_value);
		}
		
		System.out.println("\ngetParameterMap() 사용");
		Map<String, String[]> paraMap = request.getParameterMap();
		
		for(String key : paraMap.keySet()) {
			System.out.println(key + " : " + Arrays.deepToString(paraMap.get(key)));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
