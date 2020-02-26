package kr.co.jhta.erp.vo;

import java.util.Date;

public class AsService {

	private int asNo;
	private int productNo;
	private int storeNo;
	private Date createDate;
	private String status;

	public AsService() {}

	public int getAsNo() {
		return asNo;
	}

	public void setAsNo(int asNo) {
		this.asNo = asNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AsService [asNo=" + asNo + ", productNo=" + productNo + ", storeNo=" + storeNo + ", createDate="
				+ createDate + ", status=" + status + "]";
	}




}