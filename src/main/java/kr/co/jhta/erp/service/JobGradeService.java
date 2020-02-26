package kr.co.jhta.erp.service;

import java.util.List;
import java.util.Map;

import kr.co.jhta.erp.vo.jobGrade;

public interface JobGradeService {

	List<jobGrade> searchGradeByOption(Map<String, Object> criteria);

}
