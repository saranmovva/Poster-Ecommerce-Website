package edu.ben.model;

public class Product {

	String name;
	String description;
	String category;
	
	String img;

	public Product(String name, String description, String category, String img) {
		super();
		this.name = name;
		this.description = description;
		this.category = category;

		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
