package com.shoppingcart.model;

public class CartLineInfo {

	private ProductInfo productInfo;

	private int quantity;

	public CartLineInfo() {
		this.quantity = 0;
		// TODO Auto-generated constructor stub
	}

	public double getAmount() {
		return this.productInfo.getPrice() * this.quantity;
	}

	public CartLineInfo(ProductInfo productInfo, int quantity) {
		super();
		this.productInfo = productInfo;
		this.quantity = quantity;
	}

	public ProductInfo getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(ProductInfo productInfo) {
		this.productInfo = productInfo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
