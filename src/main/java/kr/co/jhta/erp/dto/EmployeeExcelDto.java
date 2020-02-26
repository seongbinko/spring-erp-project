package kr.co.jhta.erp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("EmployeeExcelDto")
public class EmployeeExcelDto {
	private Integer no;
	private String name;
	private String tel;
	private String email;
	private Integer departmentNo;
	private Integer gradeNo;
	private Date hireDate;
	
	public EmployeeExcelDto () {}
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getDepartmentNo() {
		return departmentNo;
	}
	public void setDepartmentNo(Integer departmentNo) {
		this.departmentNo = departmentNo;
	}
	public Integer getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(Integer gradeNo) {
		this.gradeNo = gradeNo;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	@Override
	public String toString() {
		return "EmployeeExcelDto [no=" + no + ", name=" + name + ", tel=" + tel + ", email=" + email + ", departmentNo="
				+ departmentNo + ", gradeNo=" + gradeNo + ", hireDate=" + hireDate + "]";
	}
}
