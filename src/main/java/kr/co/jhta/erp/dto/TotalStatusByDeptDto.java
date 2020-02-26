package kr.co.jhta.erp.dto;

import org.apache.ibatis.type.Alias;

@Alias("TotalStatusByDeptDto")
public class TotalStatusByDeptDto {
	private String department;
	private Integer incumbent;
	private Integer fullTimer;
	private Integer partTimer;
	
	public TotalStatusByDeptDto() {}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getIncumbent() {
		return incumbent;
	}

	public void setIncumbent(Integer incumbent) {
		this.incumbent = incumbent;
	}

	public Integer getFullTimer() {
		return fullTimer;
	}

	public void setFullTimer(Integer fullTimer) {
		this.fullTimer = fullTimer;
	}

	public Integer getPartTimer() {
		return partTimer;
	}

	public void setPartTimer(Integer partTimer) {
		this.partTimer = partTimer;
	}

	@Override
	public String toString() {
		return "TotalStatusByDeptDto [department=" + department + ", incumbent=" + incumbent + ", fullTimer="
				+ fullTimer + ", partTimer=" + partTimer + "]";
	}
}
