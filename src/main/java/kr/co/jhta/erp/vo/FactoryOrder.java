package kr.co.jhta.erp.vo;

import java.util.Date;

public class FactoryOrder {

	private int no;
	private Date requestDate;
	private String status;
	private int employeeNo;
	private int storageNo;
	private Date responseDate;
	
	public FactoryOrder() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}

	public int getStorageNo() {
		return storageNo;
	}

	public void setStorageNo(int storageNo) {
		this.storageNo = storageNo;
	}

	public Date getResponseDate() {
		return responseDate;
	}

	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}

	@Override
	public String toString() {
		return "FactoryOrder [no=" + no + ", requestDate=" + requestDate + ", status=" + status + ", employeeNo="
				+ employeeNo + ", storageNo=" + storageNo + ", responseDate=" + responseDate + "]";
	}

}