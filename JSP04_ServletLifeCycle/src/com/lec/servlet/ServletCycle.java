package com.lec.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tCycle")
public class ServletCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletCycle() {
        super();
        System.out.println("서블릿 생성");
    }
    
    //서블릿 생성 직후에 호출됨
    @Override
    public void init() throws ServletException {
    	System.out.println("init() 호출");
    }
    
    // 서블릿 객체 소멸될때 호출
    @Override
    public void destroy() {
    	System.out.println("destroy() 호출");
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doDelete() 호출");
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPut() 호출");
	}

}
