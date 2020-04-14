package kr.co.jhta.erp.dto;

import java.util.Date;

import kr.co.jhta.erp.utils.DateUtils;
import kr.co.jhta.erp.utils.NumberUtils;

public class ProductDto {

	private int no;
	private String name;
	private int price;
	private Date createDate;
	private int categoryNo;
	private String categoryName;
	private int upperCategoryNo;
	private String upperCategoryName;
	
	public ProductDto() {}
	
	public String getFmtDate() {
		return DateUtils.dateToString(createDate);
	}
	
	public String getNumberWithComma() {
		return NumberUtils.numberWithComma(price);
	}

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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	@Override
	public String toString() {
		return "ProductDto [no=" + no + ", name=" + name + ", price=" + price + ", createDate=" + createDate
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", upperCategoryNo="
				+ upperCategoryNo + ", upperCategoryName=" + upperCategoryName + "]";
	}

	
}
