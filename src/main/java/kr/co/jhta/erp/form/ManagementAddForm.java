package kr.co.jhta.erp.form;

import java.util.Arrays;
import java.util.Date;

public class ManagementAddForm {
	private Date[] managementDate;
	private int[] employeeNo;
	private String[] employeeName;
	private String[] managementType;
	private int[] managementAmount;
	
	ManagementAddForm() {}

	public Date[] getManagementDate() {
		return managementDate;
	}

	public void setManagementDate(Date[] managementDate) {
		this.managementDate = managementDate;
	}

	public int[] getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int[] employeeNo) {
		this.employeeNo = employeeNo;
	}

	public String[] getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String[] employeeName) {
		this.employeeName = employeeName;
	}

	public String[] getManagementType() {
		return managementType;
	}

	public void setManagementType(String[] managementType) {
		this.managementType = managementType;
	}

	public int[] getManagementAmount() {
		return managementAmount;
	}

	public void setManagementAmount(int[] managementAmount) {
		this.managementAmount = managementAmount;
	}

	@Override
	public String toString() {
		return "ManagementAddForm [managementDate=" + Arrays.toString(managementDate) + ", employeeNo="
				+ Arrays.toString(employeeNo) + ", employeeName=" + Arrays.toString(employeeName) + ", managementType="
				+ Arrays.toString(managementType) + ", managementAmount=" + Arrays.toString(managementAmount) + "]";
	}
}
