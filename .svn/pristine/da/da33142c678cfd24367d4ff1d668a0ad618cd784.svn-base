package kr.co.jhta.erp.web.cotroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.erp.dto.StoreStockDto;
import kr.co.jhta.erp.form.FactoryOrderAddForm;
import kr.co.jhta.erp.dto.ProductStockDto;
import kr.co.jhta.erp.dto.StorageStockDto;
import kr.co.jhta.erp.dto.StoreManagementDto;
import kr.co.jhta.erp.service.CategoryService;
import kr.co.jhta.erp.service.StockService;
import kr.co.jhta.erp.service.StorageService;
import kr.co.jhta.erp.service.StoreManagementService;
import kr.co.jhta.erp.vo.Category;
import kr.co.jhta.erp.vo.Employee;
import kr.co.jhta.erp.vo.Storage;
import kr.co.jhta.erp.vo.Store;

@Controller
@RequestMapping("/stock")
public class StockController {
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private StoreManagementService storeManagementService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StorageService storageService;
		
	@GetMapping("/main.erp")
	public String main() {
		return "stock/main";
	}
	
	@RequestMapping("/inquiryByStore.erp")
	public String inquiryStockByStore(Model model) {
		List<StoreManagementDto> stores = storeManagementService.getAllStoreDetails();
		model.addAttribute("stores", stores);
		
		return "stock/inquiry_store";
	}
	
	@RequestMapping("/storeStocks.erp")
	@ResponseBody
	public List<StoreStockDto> storeStocks(@RequestParam("storeNo") int storeNo) {
		List<StoreStockDto> stocks = stockService.getStoreStockDetailsByStoreNo(storeNo);
		return stocks;
	}
	
	@RequestMapping("/inquiryByProduct.erp")
	public String inquiryStockByProduct(Model model) {
		
		return "stock/inquiry_product";
	}

	@RequestMapping("/productStocks.erp")
	@ResponseBody
	public List<ProductStockDto> productStocks(@RequestParam("no") int productNo) {
		List<ProductStockDto> stocks = stockService.getProductStockDetailsByProductNo(productNo);
		return stocks;
	}
	
	@RequestMapping("/requestProducts.erp")
	public String requestProducts(Model model) {
		List<Storage> storages = storageService.getAllStorages(); 
		List<Category> upperCategories = categoryService.getAllUpperCategories();		
		model.addAttribute("storages", storages);
		model.addAttribute("upperCategories", upperCategories);
		
		return "stock/request_products";
	}
	
	@GetMapping("/storedetail.erp")
	@ResponseBody
	public Store storeDetail(@RequestParam("no") int storeNo) {
		return storeManagementService.getStoreByNo(storeNo);
	}
	
	@GetMapping("/storagedetail.erp")
	@ResponseBody
	public Storage storageDetail(@RequestParam("no") int storageNo) {
		return storageService.getStorageByNo(storageNo);
	}
	
	@RequestMapping("/storageStocks.erp")
	@ResponseBody
	public List<StorageStockDto> storageStocks(@RequestParam("storageNo") int storageNo) {
		List<StorageStockDto> stocks = storageService.getStorageStockDetailsByStorageNo(storageNo);
		return stocks;
	}
	
	@PostMapping("/request_order.erp")
	public String requestOrder(@RequestParam("productNo") int[] productNos, 
							   @RequestParam("amount") int[] amounts,
							   @RequestParam("storageNo") int storageNo, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("LE");
		int employeeNo = employee.getNo();
		
		FactoryOrderAddForm orderForm = new FactoryOrderAddForm();
		
		System.out.println(amounts[0]);
		orderForm.setStorageNo(storageNo);
		orderForm.setEmployeeNo(employeeNo);
		orderForm.setProductNos(productNos);
		orderForm.setAmounts(amounts);
		
		storageService.addNewFactoryOrder(orderForm);
		
		return "redirect:/approvals/myapprovals.erp";
	}
}
