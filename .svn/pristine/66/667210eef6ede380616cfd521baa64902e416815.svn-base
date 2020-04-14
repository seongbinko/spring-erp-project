package kr.co.jhta.erp.web.cotroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.erp.dto.OrderProductDto;
import kr.co.jhta.erp.dto.StoreManagementDto;
import kr.co.jhta.erp.dto.StoreStockDto;
import kr.co.jhta.erp.form.OrderRegisterForm;
import kr.co.jhta.erp.service.CategoryService;
import kr.co.jhta.erp.service.OrderService;
import kr.co.jhta.erp.service.StockService;
import kr.co.jhta.erp.service.StoreManagementService;
import kr.co.jhta.erp.vo.Category;
import kr.co.jhta.erp.vo.Employee;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreManagementService storeManagementService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private OrderService orderService;
	
	// 발주서 등록
	@PostMapping("/order.erp")
	public String addNewOrder(@RequestParam("storeNo") int storeNo,
							  @RequestParam("productNo") int[] productNos,
							  @RequestParam("amount") int[] amounts, HttpSession session) {
		Employee employee = (Employee)session.getAttribute("LE");
		int employeeNo = employee.getNo();
		
		OrderRegisterForm orderRegisterForm = new OrderRegisterForm();
		orderRegisterForm.setStoreNo(storeNo);
		orderRegisterForm.setProductNos(productNos);
		orderRegisterForm.setAmounts(amounts);
		orderRegisterForm.setEmployeeNo(employeeNo);
		
		orderService.insertOrder(orderRegisterForm);
		
		return "redirect:/store/order.erp?result=success";
	}
	
	@RequestMapping("/orderCategories.erp")
	@ResponseBody
	public List<Category> upperCategories() {
		return categoryService.getAllUpperCategories();
	}
	
	// 상위카테고리 번호에 해당하는 카테고리를 JSON으로 반환한다.
	@GetMapping("/uppercategory.erp")
	@ResponseBody
	public Category getUpperCategory(@RequestParam("uppercateno") int categoryNo) {
		Category category = categoryService.getUpperCategoryBySubcategoryNo(categoryNo);
		return category;
	}
	
	@GetMapping("/main.erp")
	public String storeMain() {
		
		return "store/main";
	}
	
	@GetMapping("/findStore.erp")
	public String findStore() {
		
		return "store/selectfindstoremain";
	}
	
	@GetMapping("/order.erp")
	public String order() {
		
		return "store/orderform";
	}
	
	@GetMapping("/orderhistory.erp")
	public String orderHistory() {
		
		return "store/orderhistory";
	}
	@GetMapping("/ordermodify.erp")
	public String orderModify() {
		
		return "store/ordermodify";
	}
	@GetMapping("/statistic.erp")
	public String storeStatistic() {
		
		return "store/storestatistic";
	}
	@GetMapping("/stockinformation.erp")
	public String stockInformation() {
		
		return "store/stockinformation";
	}
	@GetMapping("/transactioninformation.erp")
	public String transactionInformation() {
		
		return "store/transactioninformation";
	}
	
	@RequestMapping("/storeseachdetail.erp")
	@ResponseBody
	public StoreManagementDto storeSeachDetail(@RequestParam("no") int storeNo) {
		return storeManagementService.getStoreDetailByNo(storeNo);
	}
	
	@RequestMapping("/orderstoremodal.erp")
	@ResponseBody
	public List<StoreManagementDto> orderstoremodal() {
		
		return storeManagementService.getAllStoreDetails();
	}
	
	@RequestMapping("/orderProduct.erp")
	@ResponseBody
	public OrderProductDto orderproduct(@RequestParam("no") int orderProductNo) {
		return orderService.getAllOrderProduct(orderProductNo);
	}
	
	@RequestMapping("/getstock.erp")
	@ResponseBody
	public StoreStockDto getStock(@RequestParam("storeNo") int storeNo,
								  @RequestParam("productNo") int productNo) {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		criteria.put("storeNo", storeNo);
		criteria.put("productNo", productNo);
		StoreStockDto stock = stockService.getStoreStockDetail(criteria);
		return stock;
	}
	
}
