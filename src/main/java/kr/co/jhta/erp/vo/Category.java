package kr.co.jhta.erp.vo;

public class Category {

	private int no;
	private String name;
	private int upperCategoryNo;

	public Category() {}

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

	public int getUpperCategoryNo() {
		return upperCategoryNo;
	}

	public void setUpperCategoryNo(int upperCategoryNo) {
		this.upperCategoryNo = upperCategoryNo;
	}

	@Override
	public String toString() {
		return "Category [no=" + no + ", name=" + name + ", upperCategoryNo=" + upperCategoryNo + "]";
	}

	

	

}