package kr.co.jhta.erp.vo;

import java.util.Date;

public class ProductControl {

	private int no;
	private int productNo;
	private int amount;
	private Date createDate;
	private int storeNo;
	private String type;

	public ProductControl() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ProductControl [no=" + no + ", productNo=" + productNo + ", amount=" + amount + ", createDate="
				+ createDate + ", storeNo=" + storeNo + ", type=" + type + "]";
	}


}