package kr.co.jhta.erp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.EmployeeDao;
import kr.co.jhta.erp.dao.HrHistoryDao;
import kr.co.jhta.erp.form.InternalMobilityAddForm;
import kr.co.jhta.erp.vo.Employee;
import kr.co.jhta.erp.vo.HrHistory;
import kr.co.jhta.erp.vo.HrPagination;

@Service
public class HrHistoryServiceImpl implements HrhistoryService{

	@Autowired
	private HrHistoryDao hrHistoryDao;
	
	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public void addInternalMobility(InternalMobilityAddForm forms) {
		Date[] dates = forms.getHistoryDate();
		String[] types = forms.getHistoryType();
		int[] employeeNos = forms.getEmployeeNo();
		String[] employeeNames =forms.getEmployeeName();
		int[] prevDepartmentNos = forms.getPrevDepartmentNo();
		String[] prevDepartmentNames = forms.getPrevDepartmentName();
		int[] prevGradeNos = forms.getPrevGradeNo();
		String[] prevGradeNames = forms.getPrevGradeName(); 
		int[] departmentNos = forms.getDepartmentNo();
		String[] departmentNames = forms.getDepartmentName();
		int[] gradeNos = forms.getGradeNo();
		String[] gradeNames = forms.getGradeName();

		for(int i=0; i < dates.length; i++) {
			HrHistory hrHistory = new HrHistory();
			hrHistory.setHistoryDate(dates[i]);
			hrHistory.setHistoryType(types[i]);
			hrHistory.setEmployeeNo(employeeNos[i]);
			hrHistory.setEmployeeName(employeeNames[i]);
			hrHistory.setPrevDepartmentNo(prevDepartmentNos[i]);
			hrHistory.setPrevDepartmentName(prevDepartmentNames[i]);
			hrHistory.setPrevGradeNo(prevGradeNos[i]);
			hrHistory.setPrevGradeName(prevGradeNames[i]);
			hrHistory.setDepartmentNo(departmentNos[i]);
			hrHistory.setDepartmentName(departmentNames[i]);
			hrHistory.setGradeNo(gradeNos[i]);
			hrHistory.setGradeName(gradeNames[i]);
			hrHistoryDao.addHrHistory(hrHistory);
			
			Employee employee = employeeDao.getEmployeeByNo(employeeNos[i]);
			employee.setDepartmentNo(departmentNos[i]);
			employee.setGradeNo(gradeNos[i]);
			employeeDao.updateEmployee(employee);
		}
	}

	@Override
	public Map<String, Object> searchHrHistories(Map<String, Object> criteria) {
		if(criteria.get("option") != null ) {
			if(criteria.get("option").equals("no") || criteria.get("option").equals("employeeNo")) {
				int keyword = Integer.parseInt((String)criteria.get("keyword"));
				criteria.put("keyword", keyword );
			}
		}
		int totalSize = hrHistoryDao.getTotalPageSize(criteria);			
		Map<String, Object> hrHistoryByPage = new HashMap<String, Object>();
		if(criteria.get("pageNo") == null || criteria.get("pageNo").equals(1)) {
			HrPagination pagination = new HrPagination(1, totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			hrHistoryByPage.put("pagination", pagination);
		} else {
			HrPagination pagination = new HrPagination((Integer) criteria.get("pageNo"), totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			hrHistoryByPage.put("pagination", pagination);
		}
		List<HrHistory> hrHistories = hrHistoryDao.searchHrHistories(criteria);
		hrHistoryByPage.put("hrHistories", hrHistories);
		
		return hrHistoryByPage;
	}		
}
