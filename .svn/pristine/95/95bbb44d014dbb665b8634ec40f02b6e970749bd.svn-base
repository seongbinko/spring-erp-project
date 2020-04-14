package kr.co.jhta.erp.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Employee")
public class Employee {

	 private int no;
	 private String password;
	 private String name;
	 private Date hireDate;
	 private int salary;
	 private String tel;
	 private int departmentNo;
	 private int gradeNo;
	 private Integer managerNo;
	 private String retired;
	 private String imageName;
	 private String email;
	 
	 
	   
	 public Employee() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Integer getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(Integer managerNo) {
		this.managerNo = managerNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel1() {
		if(tel == null) {
			return "";
		}
		return tel.substring(0, 3);
	}
	public String getTel2() {
		if(tel == null) {
			return "";
		}
		return tel.substring(4, 8);
	}
	
	public String getTel3() {
		if(tel == null) {
			return "";
		}
		return tel.substring(9);
	}


	
	
	

	public String getRetired() {
		return retired;
	}

	public void setRetired(String retired) {
		this.retired = retired;
	}
	
	public String getImageName() {
		return imageName;
	}
	
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
}
