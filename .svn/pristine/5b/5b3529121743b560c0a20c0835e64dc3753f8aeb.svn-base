package kr.co.jhta.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.StoreDao;
import kr.co.jhta.erp.dto.StoreManagementDto;
import kr.co.jhta.erp.vo.Store;

@Service
public class StoreManagementServiceImpl implements StoreManagementService{

	@Autowired
	private StoreDao storeDao;
	
	@Override
	public List<Store> getAllStores() {
		return storeDao.getAllStores();
	}

	@Override
	public Store getStoreByNo(int storeNo) {
		return storeDao.getStoreByNo(storeNo);
	}
	
	//매장의 이름, 주소, 연락처를 변경
	@Override
	public void updateStore(Store store) {
		Store prevStore = storeDao.getStoreByNo(store.getNo());
		if(prevStore == null) {
			throw new RuntimeException("지점 정보 변경에 실패했습니다.");
		}
		prevStore.setName(store.getName());
		prevStore.setAddress(store.getAddress());
		prevStore.setTel(store.getTel());
		
		storeDao.updateStore(prevStore);
	}
	// 매장의 매니저를 변경
	@Override
	public void updateStoreManager(Store store) {
		Store prevStore = storeDao.getStoreByNo(store.getNo());
		if(prevStore == null) {
			throw new RuntimeException("매니저 변경에 실패했습니다.");
		}
		prevStore.setEmployeeNo(store.getEmployeeNo());
		
		storeDao.updateStore(prevStore);
	}

	// 지점조회에서 사용할 지점 상세객체 
	@Override
	public StoreManagementDto getStoreDetailByNo(int storeNo) {
		return storeDao.getStoreDetailByNo(storeNo);
	}

	@Override
	public List<StoreManagementDto> getAllStoreDetails() {
		return storeDao.getAllStoreDetails();
	}
	
	
	
}
