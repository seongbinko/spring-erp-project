package kr.co.jhta.erp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.EmployeeDao;
import kr.co.jhta.erp.dto.EmployeeDetailDto;
import kr.co.jhta.erp.vo.Employee;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public Employee login(int employeeNo, String password) {
		
		Employee employee = employeeDao.getEmployeeByNo(employeeNo);
		//String inputPassword = DigestUtils.sha1Hex(password);
		
		if(employee == null) {
			return null;
			//throw new RuntimeException("입력하신 직원번호에 해당하는 직원이 없습니다.");	
		}
		if("Y".equals(employee.getRetired())) {
			throw new RuntimeException("퇴사한 직원입니다.");	
			
		}
		
		//String shaPassword = DigestUtils.sha1Hex(employee.getPassword());
		String prevPassword = employee.getPassword();
		if(!prevPassword.equals(password)) {
			return null;
			//throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		
		return employee;
		
	}

	@Override
	public EmployeeDetailDto getEmployeeDto(int employeeNo) {
		return employeeDao.getEmployeeDetailByNo(employeeNo);
		
	}
	
	
	
}
