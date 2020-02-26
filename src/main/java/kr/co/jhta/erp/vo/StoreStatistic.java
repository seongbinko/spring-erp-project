package kr.co.jhta.erp.vo;

import java.util.Date;

public class StoreStatistic {

	private int no;
	private int storeNo;
	private Date createDate;
	private int orderCount;
	private int discusCount;
	private int exchangeCount;
	private int sellCount;

	public StoreStatistic() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getDiscusCount() {
		return discusCount;
	}

	public void setDiscusCount(int discusCount) {
		this.discusCount = discusCount;
	}

	public int getExchangeCount() {
		return exchangeCount;
	}

	public void setExchangeCount(int exchangeCount) {
		this.exchangeCount = exchangeCount;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	@Override
	public String toString() {
		return "StoreStatistic [no=" + no + ", storeNo=" + storeNo + ", createDate=" + createDate + ", orderCount="
				+ orderCount + ", discusCount=" + discusCount + ", exchangeCount=" + exchangeCount + ", sellCount="
				+ sellCount + "]";
	}


}