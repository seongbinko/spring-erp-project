package kr.co.jhta.erp.dto;

public class StoreManagementDto {
	
	private int storeNo;
	private String storeName;
	private String storeTel;
	private String storeAddress;
	private int employeeNo;
	private String employeeName;
	private String employeeTel;
	private String employeeDepartmentName;
	private String employeeGradeName;
	private String employeeImageName;
	private String employeeEmail;
	
	public StoreManagementDto() {}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreTel() {
		return storeTel;
	}

	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public int getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeTel() {
		return employeeTel;
	}

	public void setEmployeeTel(String employeeTel) {
		this.employeeTel = employeeTel;
	}

	public String getEmployeeDepartmentName() {
		return employeeDepartmentName;
	}

	public void setEmployeeDepartmentName(String employeeDepartmentName) {
		this.employeeDepartmentName = employeeDepartmentName;
	}

	public String getEmployeeGradeName() {
		return employeeGradeName;
	}

	public void setEmployeeGradeName(String employeeGradeName) {
		this.employeeGradeName = employeeGradeName;
	}

	public String getEmployeeImageName() {
		return employeeImageName;
	}

	public void setEmployeeImageName(String employeeImageName) {
		this.employeeImageName = employeeImageName;
	}

	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	@Override
	public String toString() {
		return "StoreManagementDto [storeNo=" + storeNo + ", storeName=" + storeName + ", storeTel=" + storeTel
				+ ", storeAddress=" + storeAddress + ", employeeNo=" + employeeNo + ", employeeName=" + employeeName
				+ ", employeeTel=" + employeeTel + ", employeeDepartmentName=" + employeeDepartmentName
				+ ", employeeGradeName=" + employeeGradeName + ", employeeImageName=" + employeeImageName
				+ ", employeeEmail=" + employeeEmail + "]";
	}

	
}
