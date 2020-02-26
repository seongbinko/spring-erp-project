package kr.co.jhta.erp.form;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeAddform {
	private int no;
	private String name;
	private String tel;
	private String email;
	private Date hireDate;
	private int departmentNo;
	private int gradeNo;
	private MultipartFile imgFile;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
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
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public int getDepartmentNo() {
		return departmentNo;
	}
	public void setDepartmentNo(int departmentNo) {
		this.departmentNo = departmentNo;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	@Override
	public String toString() {
		return "EmployeeAddform [no=" + no + ", name=" + name + ", tel=" + tel + ", email=" + email + ", hireDate="
				+ hireDate + ", departmentNo=" + departmentNo + ", gradeNo=" + gradeNo + ", imgFile=" + imgFile + "]";
	}
	
	
}
