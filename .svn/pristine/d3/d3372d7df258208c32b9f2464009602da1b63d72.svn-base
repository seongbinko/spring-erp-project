package kr.co.jhta.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.EmployeeDao;
import kr.co.jhta.erp.dao.FactoryOrderDao;
import kr.co.jhta.erp.dao.ProductApprovalDao;
import kr.co.jhta.erp.dao.StorageDao;
import kr.co.jhta.erp.dto.StorageStockDto;
import kr.co.jhta.erp.form.FactoryOrderAddForm;
import kr.co.jhta.erp.vo.Employee;
import kr.co.jhta.erp.vo.FactoryOrderItem;
import kr.co.jhta.erp.vo.ProductApproval;
import kr.co.jhta.erp.vo.Storage;

@Service
public class StorageServiceImpl implements StorageService{

	@Autowired
	private StorageDao storageDao;
	
	@Autowired
	private FactoryOrderDao factoryOrderDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private ProductApprovalDao approvalDao;
	
	@Override
	public List<Storage> getAllStorages() {
		return storageDao.getAllStorages();
	}

	@Override
	public List<StorageStockDto> getStorageStockDetailsByStorageNo(int storageNo) {
		return storageDao.getStorageStockDetailsByStorageNo(storageNo);
	}

	@Override
	public Storage getStorageByNo(int storageNo) {
		return storageDao.getStorageByNo(storageNo);
	}

	@Override
	public void addNewFactoryOrder(FactoryOrderAddForm orderForm) {
		factoryOrderDao.insertOrder(orderForm);
		System.out.println(orderForm.getNo());
		
		FactoryOrderItem orderItem = new FactoryOrderItem();
		int[] productNos = orderForm.getProductNos();
		int[] amounts = orderForm.getAmounts();
		
		orderItem.setOrderNo(orderForm.getNo());
		 for(int i=0; i<productNos.length; i++) {
			 int productNo = productNos[i];
			 int amount = amounts[i];
			 orderItem.setProductNo(productNo); 
			 orderItem.setAmount(amount);
		 
			 factoryOrderDao.insertOrderItem(orderItem); 
		 }
		 
		 ProductApproval approval = new ProductApproval();
		 approval.setTypeNo(20);
		 approval.setRequesterNo(orderForm.getEmployeeNo());
		 Employee emp = employeeDao.getEmployeeByNo(orderForm.getEmployeeNo());		 
		 approval.setResponserNo(emp.getManagerNo());
		 approval.setFactoryOrderNo(orderForm.getNo());
		 
		 approvalDao.insertFactoryApproval(approval);
	}
	
}
