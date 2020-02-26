package kr.co.jhta.erp.vo;

public class StoreStock {

	private int storeNo;
	private int productNo;
	private int amount;

	public StoreStock() {}

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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "StoreStock [storeNo=" + storeNo + ", productNo=" + productNo + ", amount=" + amount + "]";
	}




}