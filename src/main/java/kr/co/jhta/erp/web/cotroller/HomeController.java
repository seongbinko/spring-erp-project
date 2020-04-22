package kr.co.jhta.erp.web.cotroller;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.jhta.erp.dto.EmployeeDetailDto;
import kr.co.jhta.erp.service.AttendanceService;
import kr.co.jhta.erp.vo.Attendance;

@Controller
public class HomeController {

	@Autowired
	private AttendanceService attendanceService;
	

	@GetMapping("/home.erp")
	public String home() {
		
		return "home";
	}
	
	@RequestMapping("/main.erp") 
	public String main(Model model, HttpSession session) {
		EmployeeDetailDto employee = (EmployeeDetailDto) session.getAttribute("LE_detail");
		if(employee == null) {
			return "redirect:/home.erp";
		}
		int deptNo = employee.getDepartmentNo();

		Attendance attendance = attendanceService.getAttendanceTodayByEmpNo(employee.getNo());
		model.addAttribute("attendance", attendance);
		return "main";
	}
	
	@RequestMapping("/intimeUser.erp")
	public String intimeUser(@RequestParam("empNo") int employeeNo,@RequestParam("empName") String employeeName ,@RequestParam("times") long intime) throws Exception {
		Date intimeDate = new Date(intime);
		attendanceService.addEmployeeAttendance(employeeNo, employeeName, intimeDate);
		return "redirect:/main.erp";
	}
	@RequestMapping("/outtimeUser.erp")
	public String outtimeUser(@RequestParam("empNo") int employeeNo, @RequestParam("empName") String employeeName, @RequestParam("times") long outtime) {
		Date outtimeDate = new Date(outtime);
		attendanceService.updateEmployeeAttendance(employeeNo, outtimeDate);
		return "redirect:/main.erp";
	}
}
