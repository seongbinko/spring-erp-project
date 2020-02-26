package kr.co.jhta.erp.web.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.erp.dto.StoreFindDto;
import kr.co.jhta.erp.service.StoreService;

@RestController
public class StoreRestController {

	@Autowired
	StoreService storeService;
	
	@RequestMapping("/restStore")
	public List<StoreFindDto> restStore(String keyword) {
		
		System.out.println(keyword);
		return storeService.getStoreFinds(keyword);
	}

}