package kr.co.jhta.erp.dao;

import java.util.List;

import kr.co.jhta.erp.dto.StorageStockDto;
import kr.co.jhta.erp.vo.Storage;
import kr.co.jhta.erp.vo.StorageStock;

public interface StorageDao {

	List<Storage> getAllStorages();
	List<StorageStockDto> getStorageStockDetailsByStorageNo(int storageNo);
	Storage getStorageByNo(int storageNo);
	StorageStock getStorageStockByNo(int storageNo);
	void insertStock(StorageStock storageStock);
	int getStockAmountByStorageNoAndProductNo(StorageStock storageStock);
	void updateStockAmountByStorageNoAndProductNo(StorageStock storageStock);
	
}
