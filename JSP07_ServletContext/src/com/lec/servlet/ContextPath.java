package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ConPath")
public class ContextPath extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContextPath() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// URL : Uniform Resource Locator 통합파일 식별자
		StringBuffer url = request.getRequestURL();

		// URI : Uniform Resource Identifier 통합자원 식별자
		String uri = request.getRequestURI();

		// Context Path
		String conPath = request.getContextPath();

		// domain 추출
		String url_domain = request.getScheme() + "://" // http
				+ request.getServerName() + ":" + request.getServerPort();
		
		ServletContext context = request.getServletContext();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<hr>");
		out.println("URL: "+url+"<br>");
		out.println("URI: "+uri+"<br>");
		out.println("ContextPath: "+conPath+"<br>");
		out.println("URL_domain: "+url_domain+"<br>");
		
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
