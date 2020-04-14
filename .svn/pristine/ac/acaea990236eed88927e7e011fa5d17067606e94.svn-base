package kr.co.jhta.erp.vo;

import java.util.Date;

import kr.co.jhta.erp.utils.DateUtils;
import kr.co.jhta.erp.utils.NumberUtils;

public class Product {

	private int no;
	private String name;
	private int price;
	private Date createDate;
	private int categoryNo;
	private int amount;

	public Product() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getFmtDate() {
		return DateUtils.dateToString(createDate);
	}
	
	public String getPriceWithComma() {
		return NumberUtils.numberWithComma(price);
	}
	
	@Override
	public String toString() {
		return "Product [no=" + no + ", name=" + name + ", price=" + price + ", createDate=" + createDate
				+ ", categoryNo=" + categoryNo + "]";
	}



}
