package kr.co.jhta.erp.form;

import java.util.Arrays;

public class FactoryOrderAddForm {

	private int no;
	private int storageNo;
	private int employeeNo;
	private int[] productNos;
	private int[] amounts;

	public FactoryOrderAddForm() {}

	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStorageNo() {
		return storageNo;
	}

	public void setStorageNo(int storageNo) {
		this.storageNo = storageNo;
	}

	public int getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}

	public int[] getProductNos() {
		return productNos;
	}

	public void setProductNos(int[] productNos) {
		this.productNos = productNos;
	}

	public int[] getAmounts() {
		return amounts;
	}

	public void setAmounts(int[] amounts) {
		this.amounts = amounts;
	}

	@Override
	public String toString() {
		return "FactoryOrderAddForm [storageNo=" + storageNo + ", employeeNo=" + employeeNo + ", productNos="
				+ Arrays.toString(productNos) + ", amounts=" + Arrays.toString(amounts) + "]";
	}

	
}