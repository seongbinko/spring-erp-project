package kr.co.jhta.erp.vo;

public class FactoryOrderItem {

	private int orderNo;
	private int productNo;
	private int amount;
	
	public FactoryOrderItem() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
		return "FactoryOrderItem [orderNo=" + orderNo + ", productNo=" + productNo + ", amount=" + amount + "]";
	}
	
}
