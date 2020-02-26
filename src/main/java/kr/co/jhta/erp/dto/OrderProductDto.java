package kr.co.jhta.erp.dto;

import java.util.Date;

import kr.co.jhta.erp.utils.DateUtils;
import kr.co.jhta.erp.utils.NumberUtils;

public class OrderProductDto {

	private int upperCategoryNo;
	private String upperCategoryName;
	private int categoryNo;
	private String categoryName;
	private int productNo;
	private String productName;
	private int storeNo;
	private String storeName;
	private int storeStockAmount;
	private int orderAmount;
	private int productPrice;
	private Date createDate;
	private int totalPrice;
	
	public OrderProductDto() {}
	
	public String getFmtDate() {
		return DateUtils.dateToString(createDate);
	}
	
	public String getNumberWithComma() {
		return NumberUtils.numberWithComma(productPrice);
	}

	public int getUpperCategoryNo() {
		return upperCategoryNo;
	}

	public void setUpperCategoryNo(int upperCategoryNo) {
		this.upperCategoryNo = upperCategoryNo;
	}

	public String getUpperCategoryName() {
		return upperCategoryName;
	}

	public void setUpperCategoryName(String upperCategoryName) {
		this.upperCategoryName = upperCategoryName;
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

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public int getStoreStockAmount() {
		return storeStockAmount;
	}

	public void setStoreStockAmount(int storeStockAmount) {
		this.storeStockAmount = storeStockAmount;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getTotalPrice() {
		totalPrice = getOrderAmount() * getOrderAmount();
		return totalPrice;
	}

	@Override
	public String toString() {
		return "OrderProductDto [upperCategoryNo=" + upperCategoryNo + ", upperCategoryName=" + upperCategoryName
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", productNo=" + productNo
				+ ", productName=" + productName + ", storeNo=" + storeNo + ", storeName=" + storeName
				+ ", storeStockAmount=" + storeStockAmount + ", orderAmount=" + orderAmount + ", productPrice="
				+ productPrice + ", createDate=" + createDate + ", totalPrice=" + totalPrice + "]";
	}
}
