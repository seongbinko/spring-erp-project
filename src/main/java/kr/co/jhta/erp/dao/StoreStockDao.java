package kr.co.jhta.erp.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.erp.dto.ProductStockDto;
import kr.co.jhta.erp.dto.StoreStockDto;
import kr.co.jhta.erp.vo.StoreStock;

public interface StoreStockDao {

	List<StoreStockDto> getStoreStockDetailsByStoreNo(int storeNo);
	List<ProductStockDto> getProductStockDetailsByProductNo(int productNo);
	StoreStockDto getStoreStockDetail(Map<String, Object> criteria);
	int getStockAmountByStoreNoAndProductNo(StoreStock storeStock);
	void updateStockAmountByStoreNoAndProductNo(StoreStock storeStock);
	void insertStock(StoreStock storeStock);
	
}