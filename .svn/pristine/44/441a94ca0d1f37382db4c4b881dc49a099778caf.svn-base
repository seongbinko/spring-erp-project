package kr.co.jhta.erp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.EmployeeDao;
import kr.co.jhta.erp.dao.ManagementDao;
import kr.co.jhta.erp.dto.EmployeeDetailDto;
import kr.co.jhta.erp.form.ManagementAddForm;
import kr.co.jhta.erp.vo.Employee;
import kr.co.jhta.erp.vo.HrPagination;
import kr.co.jhta.erp.vo.Management;

@Service
public class ManagementServiceImpl implements ManagementService{
	
	@Autowired
	private ManagementDao managementDao;
		
	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public void addManagement(ManagementAddForm managementAddForm) {
		
		System.out.println(managementAddForm);
		Date[] dates = managementAddForm.getManagementDate();
		int[] nos = managementAddForm.getEmployeeNo();
		String[] names = managementAddForm.getEmployeeName();
		String[] types = managementAddForm.getManagementType();
		int[] amounts = managementAddForm.getManagementAmount();
		System.out.println(dates);
		
		for(int i=0; i< dates.length; i++) {
			Management management = new Management();
			management.setManagementDate(dates[i]);
			management.setEmployeeNo(nos[i]);
			management.setEmployeeName(names[i]);
			management.setType(types[i]);
			management.setAmount(amounts[i]);
			System.out.println(management);
			managementDao.addManagement(management);
		}
	}
	
	@Override
	public Map<String, Object> searchManagment(Map<String, Object> criteria) {
		if(criteria.get("option") != null ) {
			if(criteria.get("option").equals("no") || criteria.get("option").equals("employeeNo")) {
				int keyword = Integer.parseInt((String)criteria.get("keyword"));
				criteria.put("keyword", keyword );
			}
		}
		int totalSize = managementDao.getTotalPageSize(criteria);			
		Map<String, Object> managementByPage = new HashMap<String, Object>();
		if(criteria.get("pageNo") == null || criteria.get("pageNo").equals(1)) {
			HrPagination pagination = new HrPagination(1, totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			managementByPage.put("pagination", pagination);
		} else {
			HrPagination pagination = new HrPagination((Integer) criteria.get("pageNo"), totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			managementByPage.put("pagination", pagination);
		}
		List<Management> management = managementDao.searchManagement(criteria);
		managementByPage.put("management", management);
		
		return managementByPage;
		
		
	}
	// 급여계산 로직
	@Override
	public int getTotalPayment(String payMonth, String[] selectedEmpNos, String paymentType) {
		
		int payrollAmount = 0;
		
		if("급여".equals(paymentType)) {
			
			for(String empNo : selectedEmpNos) {
			
				int employeeNo = Integer.parseInt(empNo);
				EmployeeDetailDto employeeDetail = employeeDao.getEmployeeDetailByNo(employeeNo);
				int gradeSalary = employeeDetail.getGradeSalary();
				
				Employee employee = employeeDao.getEmployeeByNo(employeeNo);
				Map<String, Object> criteria = new HashMap<String, Object>();
				criteria.put("payMonth", payMonth);
				criteria.put("empNo", employeeNo);
				
				int totalManagement = 0;
				List<Management> managementEmp = managementDao.getManagementByEmpNoByPayMonth(criteria);
				for(Management mg : managementEmp) {
					String type = mg.getType();
					if(type.equals("지각")) {
						totalManagement -= mg.getAmount();
					} else {
						totalManagement += mg.getAmount();
					}
					
				}
				int totalEmpSalary = (int) (gradeSalary + (gradeSalary*totalManagement*0.05));
				
				employee.setSalary(totalEmpSalary);				
				employeeDao.updateEmployee(employee);
				payrollAmount += totalEmpSalary;
			}
		}
		managementDao.updateManagement();
		return payrollAmount;
	}
}
