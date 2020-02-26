package kr.co.jhta.erp.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.erp.vo.Department;

public interface DepartmentDao {

	List<Department> getAllDepartments();

	List<Department> getDepartmentByOption(Map<String, Object> criteria);

	void addDepartment(Department department);

	void deleteDepartmentByNo(int departmentNo);

	void updateDepartment(Department department);
}
