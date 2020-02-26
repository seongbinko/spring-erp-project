package kr.co.jhta.erp.service;

import java.util.List;
import java.util.Map;

import kr.co.jhta.erp.dto.ProductStockDto;
import kr.co.jhta.erp.dto.StoreStockDto;

public interface StockService {

	List<StoreStockDto> getStoreStockDetailsByStoreNo(int storeNo);
	List<ProductStockDto> getProductStockDetailsByProductNo(int productNo);
	StoreStockDto getStoreStockDetail(Map<String, Object> criteria);
}
