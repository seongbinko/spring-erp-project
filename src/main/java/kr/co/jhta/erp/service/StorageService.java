package kr.co.jhta.erp.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.erp.dto.StorageStockDto;
import kr.co.jhta.erp.form.FactoryOrderAddForm;
import kr.co.jhta.erp.vo.Storage;


public interface StorageService {

	List<Storage> getAllStorages();
	List<StorageStockDto> getStorageStockDetailsByStorageNo(int storageNo);
	Storage getStorageByNo(int storageNo);
	
	@Transactional
	void addNewFactoryOrder(FactoryOrderAddForm orderForm);
}
