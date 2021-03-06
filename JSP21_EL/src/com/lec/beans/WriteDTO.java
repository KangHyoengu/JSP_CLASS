package com.lec.beans;

//DTO : data transfer Object
public class WriteDTO {
	private int uid;
	private String subject;
	private String content;
	private String name;
	private int viewCnt;
	private String regDate;
	
	// 개발시..
	// 다음 3가지 네이밍은 일치시켜주는 것이 좋다 .
	// 클래스 필드명 = DB 필드명  = form 의 name명
	
	//기본 생성자
	public WriteDTO() {
		super();
		//System.out.println("WriteDTO() 객체 생성");
	}
	
	//매개변수를 받는 생성자
	public WriteDTO(int uid, String subject, String content, String name, int viewCnt) {
		super();
		this.uid = uid;
		this.subject = subject;
		this.content = content;
		this.name = name;
		this.viewCnt = viewCnt;
		//System.out.printf("WriteDTO(%d, %s, %s, %s, %d)", uid, subject, content, name, viewCnt);
	}
	
	// getter/setter
	public int getUid() {
		//System.out.println("getUid() 호출");
		return uid;
	}

	public void setUid(int uid) {
		//System.out.println("setUid("+uid+") 호출");
		this.uid = uid;
	}

	public String getSubject() {
		//System.out.println("getSubject() 호출");
		return subject;
	}

	public void setSubject(String subject) {
		//System.out.println("setSubject("+subject+") 호출");
		this.subject = subject;
	}

	public String getContent() {
		//System.out.println("getContent() 호출");
		return content;
	}

	public void setContent(String content) {
		//System.out.println("setContent("+content+") 호출");
		this.content = content;
	}

	public String getName() {
		//System.out.println("getName() 호출");
		return name;
	}

	public void setName(String name) {
		//System.out.println("setName("+name+") 호출");
		this.name = name;
	}

	public int getViewCnt() {
		//System.out.println("getViewCnt() 호출");
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		//System.out.println("setViewCnt("+viewCnt+") 호출");
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		//System.out.println("getRegDate() 호출");
		return regDate;
	}

	public void setRegDate(String regDate) {
		//System.out.println("setRegDate("+regDate+") 호출");
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("WriteDTO] %d : %s : %s : %s : %d : %s", 
				uid, subject, content, name, viewCnt, regDate);
	}
	
}
