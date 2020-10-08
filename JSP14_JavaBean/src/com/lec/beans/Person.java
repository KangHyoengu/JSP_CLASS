package com.lec.beans;

public class Person {
	private String name, gender;
	private int age, id;
	
	//생성자
	public Person() {
		super();
		System.out.println("Person() 생성");
	}

	//매개변수 받는 생성자
	public Person(String name, String gender, int age, int id) {
		super();
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.id = id;
	}

	//getter / setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
