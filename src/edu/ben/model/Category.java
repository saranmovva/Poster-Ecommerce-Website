package edu.ben.model;

public class Category {

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category(String name) {
		this.name = name;
	}
	
	public String toString() {
		return name;
	}
}
