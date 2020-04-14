package kr.co.jhta.erp.dto;

import java.util.Date;

import kr.co.jhta.erp.utils.DateUtils;

public class StoreStockDto {

	private int storeNo;
	private int productNo;
	private String productName;
	private int productPrice;
	private int categoryNo;
	private String categoryName;
	private Date productCreateDate;
	private int amount;
	
	public StoreStockDto() {}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Date getProductCreateDate() {
		return productCreateDate;
	}

	public void setProductCreateDate(Date productCreateDate) {
		this.productCreateDate = productCreateDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getFmtProductCreateDate() {
		return DateUtils.dateToString(productCreateDate);
	}

	@Override
	public String toString() {
		return "StockDto [storeNo=" + storeNo + ", productNo=" + productNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName
				+ ", productCreateDate=" + productCreateDate + ", amount=" + amount + "]";
	}
}
