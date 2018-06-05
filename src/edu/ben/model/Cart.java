package edu.ben.model;

import java.util.ArrayList;

public class Cart {

	private ArrayList<Product> cart;

	public Cart(ArrayList<Product> cart) {
		super();
		this.cart = cart;
	}

	public ArrayList<Product> getCart() {
		return cart;
	}

	public void setCart(ArrayList<Product> cart) {
		this.cart = cart;
	}
	
	
}
