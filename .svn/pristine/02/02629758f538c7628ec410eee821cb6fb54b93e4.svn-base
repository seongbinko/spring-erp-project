package kr.co.jhta.erp.dao;
import java.util.List;
import java.util.Map;
import kr.co.jhta.erp.vo.Management;

public interface ManagementDao {

	void addManagement(Management management);

	int getTotalPageSize(Map<String, Object> criteria);

	List<Management> searchManagement(Map<String, Object> criteria);

	List<Management> getSelectedEmpByPayMonth(String payMonth);

	List<Management> getManagementByEmpNoByPayMonth(Map<String, Object> values);

	void updateManagement();



}
