package kr.co.jhta.erp.web.cotroller;

import java.io.File;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.erp.dto.EmployeeDetailDto;
import kr.co.jhta.erp.form.EmployeeModifyForm;
import kr.co.jhta.erp.service.EmployeeService;
import kr.co.jhta.erp.service.MessageService;
import kr.co.jhta.erp.vo.Employee;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Value("${employeeImage.source.directory}")
	private String employeeImageFileDirectory;

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MessageService messageService;
	

	@ModelAttribute
	public void messageCount(HttpSession session, Model model) {
		Employee employee = (Employee) session.getAttribute("LE");
		if (employee != null) {
			int getMessageCount = messageService.getMessageCount(employee.getNo());
			int sendMessageCount = messageService.sendMessageCount(employee.getNo());
			
			model.addAttribute("getMessageCount", getMessageCount);
			model.addAttribute("sendMessageCount", sendMessageCount);
		}
	}
	
	@RequestMapping("/my.erp")
	public String getMyInfoByNo(HttpSession session, Model model) {
		
		Employee employee = (Employee) session.getAttribute("LE");
		if (employee == null) {
			return "redirect:/home.erp";
		}
		
		EmployeeDetailDto myInfo = employeeService.getMyInfoByNo(employee.getNo());
		
		
		model.addAttribute("myInfo", myInfo);
		
		return "my/my";
	}
	
	@GetMapping("/modify.erp")
	public String modifyMyInfo() {
		return "my/modify";
	}
	
	@PostMapping("/modify.erp")
	public String modifyMyInfo(EmployeeModifyForm modifyForm, HttpSession session) throws Exception {
		Employee employee = (Employee) session.getAttribute("LE");
		
		if (employee == null) {
			return "redirect:/home.erp";
		}
		
		if(!employee.getPassword().equals(modifyForm.getUserpwd())) {
			return "redirect:/my/modify.erp?error=fail";
		} 
		
		employee.setTel(modifyForm.getTel1() + "-" + modifyForm.getTel2() + "-" + modifyForm.getTel3());
		employee.setPassword(modifyForm.getNewpwd());
		employee.setEmail(modifyForm.getEmail());
		
		MultipartFile imgfile = modifyForm.getImgFile();
		if(!imgfile.isEmpty()) {
			
			String filename = imgfile.getOriginalFilename();
			FileCopyUtils.copy(imgfile.getBytes(), new File(employeeImageFileDirectory, filename));
			
		employee.setImageName(filename);
		
		System.out.println(employee.getImageName());
		}
		
		employeeService.updateEmployee(employee);
		
		return "redirect:/my/my.erp";
	}
	
	@RequestMapping("/searchemployee.erp")
	public String searchEmployee() {
		
		return "my/searchemployee";
	}
	
}
