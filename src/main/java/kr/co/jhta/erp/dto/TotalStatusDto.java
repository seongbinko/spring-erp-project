package kr.co.jhta.erp.dto;

import org.apache.ibatis.type.Alias;

@Alias("TotalStatusDto")
public class TotalStatusDto {
	private Integer incumbent;
	private Integer newComer;
	private Integer newbie;
	private Integer newSenior;
	private Integer totalStatus;
	
	public TotalStatusDto() {}

	public Integer getIncumbent() {
		return incumbent;
	}

	public void setIncumbent(Integer incumbent) {
		this.incumbent = incumbent;
	}

	public Integer getNewComer() {
		return newComer;
	}

	public void setNewComer(Integer newComer) {
		this.newComer = newComer;
	}

	public Integer getNewbie() {
		return newbie;
	}

	public void setNewbie(Integer newbie) {
		this.newbie = newbie;
	}

	public Integer getNewSenior() {
		return newSenior;
	}

	public void setNewSenior(Integer newSenior) {
		this.newSenior = newSenior;
	}

	public Integer getTotalStatus() {
		return totalStatus;
	}

	public void setTotalStatus(Integer totalStatus) {
		this.totalStatus = totalStatus;
	}

	@Override
	public String toString() {
		return "TotalStatusDto [incumbent=" + incumbent + ", newComer=" + newComer + ", newbie=" + newbie
				+ ", newSenior=" + newSenior + ", totalStatus=" + totalStatus + "]";
	}
}
