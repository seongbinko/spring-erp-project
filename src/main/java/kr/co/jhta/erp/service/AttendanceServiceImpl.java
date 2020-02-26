package kr.co.jhta.erp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.jhta.erp.dao.AttendanceDao;
import kr.co.jhta.erp.dao.ManagementDao;
import kr.co.jhta.erp.vo.Attendance;
import kr.co.jhta.erp.vo.HrPagination;
import kr.co.jhta.erp.vo.Management;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Autowired
	private ManagementDao managementDao;

	@Override
	public void addEmployeeAttendance(int employeeNo, String employeeName, Date intime) throws Exception {
		
		Attendance attendance = new Attendance();
		attendance.setInTime(intime);
		attendance.setAttendanceDate(intime);
		attendance.setEmployeeNo(employeeNo);
		attendance.setEmployeeName(employeeName);
		
		attendanceDao.addEmployeeAttendance(attendance);
		
	}

	@Override
	public Attendance getAttendanceTodayByEmpNo(int employeeNo) {
		
		return attendanceDao.getAttendanceTodayByEmpNo(employeeNo);
	}

	@Override
	public void updateEmployeeAttendance(int employeeNo, Date outtime) {
		
		Attendance attendance = attendanceDao.getAttendanceTodayByEmpNo(employeeNo);
		attendance.setOutTime(outtime);
		attendance.setStatus("N");
		long diff = outtime.getTime() - attendance.getInTime().getTime();
		
		double amount =  diff/ (double)(1000*60*60);
		System.out.println(amount);
		if(amount > 9.0) {
			amount = amount-9.0; 
			attendance.setOvertimeAmount(amount);
			
		} else {
			amount = Math.abs(amount -9.0);
			System.out.println(amount);
			attendance.setLatetimeAmount(amount);
		}
		attendanceDao.updateEmployeeAttendance(attendance);
	}

	@Override
	public Map<String, Object> searchAttendances(Map<String, Object> criteria) {
		if(criteria.get("option") != null ) {
			if(criteria.get("option").equals("no") || criteria.get("option").equals("employeeNo")) {
				int keyword = Integer.parseInt((String)criteria.get("keyword"));
				criteria.put("keyword", keyword );
			}
		}
		int totalSize = attendanceDao.getTotalPageSize(criteria);			
		Map<String, Object> attendanceByPage = new HashMap<String, Object>();
		if(criteria.get("pageNo") == null || criteria.get("pageNo").equals(1)) {
			HrPagination pagination = new HrPagination(1, totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			attendanceByPage.put("pagination", pagination);
		} else {
			HrPagination pagination = new HrPagination((Integer) criteria.get("pageNo"), totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			attendanceByPage.put("pagination", pagination);
		}
		List<Attendance> attendances = attendanceDao.searchAttendances(criteria);
		attendanceByPage.put("attendances", attendances);
		return attendanceByPage;
	}

	@Override
	public List<Management> attendanceFixed(String payMonth) {
		List<Attendance> attendances =  attendanceDao.getAllAttendanceByStatus(payMonth);
		Management mg = new Management();
		for(Attendance att: attendances) {
			if(att.getOvertimeAmount() !=0 || att.getLatetimeAmount() != 0) {
				if(att.getOvertimeAmount() != 0) {
					mg.setAmount(att.getOvertimeAmount());
					mg.setType("초과근무");
				}
				if(att.getLatetimeAmount() != 0) {
					mg.setAmount(att.getLatetimeAmount());
					mg.setType("지각");
				}
				mg.setEmployeeNo(att.getEmployeeNo());			
				mg.setEmployeeName(att.getEmployeeName());
				mg.setManagementDate(att.getAttendanceDate());
				managementDao.addManagement(mg);
			}
			att.setFixedStatus("Y");
			attendanceDao.updateEmployeeAttendance(att);
		}
		return managementDao.getSelectedEmpByPayMonth(payMonth);
	}
}
