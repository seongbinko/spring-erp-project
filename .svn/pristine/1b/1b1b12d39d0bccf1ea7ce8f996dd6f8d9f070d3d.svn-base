package kr.co.jhta.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.DepartmentDao;
import kr.co.jhta.erp.vo.Department;

@Service
public class DepartmentServiceImpl implements DepartmentSerivce  {

	@Autowired
	private DepartmentDao departmentDao;
	
	@Override
	public List<Department> getAllDepartments() {
		return departmentDao.getAllDepartments();
	}

	@Override
	public List<Department> searchDepartmentByOption(Map<String, Object> criteria) {
		if(criteria.get("option") != null && criteria.get("option").equals("no")) {
			int keyword = Integer.parseInt((String)criteria.get("keyword"));
			criteria.put("keyword", keyword );
		}
		List<Department> departments = departmentDao.getDepartmentByOption(criteria);
		return departments;
	}

	@Override
	public void addDepartment(Department department) {
		departmentDao.addDepartment(department);
	}

	@Override
	public void delteDepartmentByNo(int departmentNo) {
		departmentDao.deleteDepartmentByNo(departmentNo);
		
	}

	@Override
	public void updateDepartment(Department department) {
		departmentDao.updateDepartment(department);
	}

}
