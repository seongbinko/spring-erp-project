package kr.co.jhta.erp.service;

import java.util.List;
import java.util.Map;

import kr.co.jhta.erp.dto.EmployeeDetailDto;
import kr.co.jhta.erp.dto.EmployeeExcelDto;
import kr.co.jhta.erp.vo.Employee;

public interface EmployeeService {

	EmployeeDetailDto getMyInfoByNo(int employeeNo);
	List<EmployeeDetailDto> getAllEmployees();
	Map<String, Object> searchByoption(Map<String, Object> criteria);
	void updateEmployee(Employee employee);
	void addOneEmployee(Employee employee);
	void deleteEmployeeByNo(int[] employeeNos);
	List<EmployeeDetailDto> getEmployeesByDepartmentNo(int no);
	void addExcelEmployee(EmployeeExcelDto employeeExcelDto);
	EmployeeDetailDto getEmployeeDetailByNo(int employeeNo);
	List<EmployeeDetailDto> getSelectEmployees(Map<String, Object> criteria);
	Map<String, Object> getPersonnelStatus(String year);
	List<EmployeeDetailDto>getAllEmployeesName();
	
}
