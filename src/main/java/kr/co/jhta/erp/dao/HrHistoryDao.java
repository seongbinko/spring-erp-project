package kr.co.jhta.erp.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.erp.vo.HrHistory;

public interface HrHistoryDao {

	void addHrHistory(HrHistory hrHistory);

	List<HrHistory> searchHrHistories(Map<String, Object> criteria);

	int getTotalPageSize(Map<String, Object> criteria);

}
