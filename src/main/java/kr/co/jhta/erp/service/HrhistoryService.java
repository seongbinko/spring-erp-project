package kr.co.jhta.erp.service;

import java.util.Map;

import kr.co.jhta.erp.form.InternalMobilityAddForm;

public interface HrhistoryService {

	void addInternalMobility(InternalMobilityAddForm forms);
	Map<String, Object> searchHrHistories(Map<String, Object> criteria);
}
