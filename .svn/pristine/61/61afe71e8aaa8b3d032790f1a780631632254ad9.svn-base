package kr.co.jhta.erp.vo;

import org.apache.ibatis.type.Alias;

import kr.co.jhta.erp.utils.NumberUtils;

@Alias("HrPagination")
public class HrPagination {
	private Integer rowsPerPage;  // 한 페이지당 표시할 데이터 행의 갯수
	private Integer pagesPerPage; // 한 페이지당 표시할 페이지번호 갯수
	private Integer pageNo;		  // 요청한 페이지 번호
	private Integer totalRows;    // 전체 데이터 갯수(조회조건을 만족하는)
	
	public HrPagination (Integer pageNo, Integer totalRows) {
		rowsPerPage = 10;
		pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}
	/**
	 * 전체 페이지 갯수를 반환한다
	 * @return 총 구간 갯수
	 */
	public int getTotalPages() {
		return NumberUtils.ceil(totalRows, rowsPerPage);
	}
	
	/**
	 * 전체 구간갯수를 반환한다.
	 * @return 현재 구간갯수
	 */
	public int getTotalBlocksCount() {
		return  NumberUtils.ceil( getTotalPages(), pagesPerPage); 
	}
	
	/**
	 * 요청한 페이지 번호가 속한 현재 구간을 반환한다.
	 * @return 현재 구간번호
	 */
	public int getCurrentBlockNo() {
		return NumberUtils.ceil(pageNo, pagesPerPage);
	}
	
	/**
	 * 페이지 내비게이션의 시작 페이지 번호를 반환한다
	 * @return 시작 페이지 번호
	 */
	public int getBeginPage() {
		return (getCurrentBlockNo() -1)*pagesPerPage + 1;
	}
	
	/**
	 * 페이지 내비게이션의 끝 페이지 번호를 반환한다
	 * @return 끝 페이지 번호
	 */
	public int getEndPage() {
		return (getCurrentBlockNo() == getTotalBlocksCount() ? getTotalPages() : getCurrentBlockNo()*pagesPerPage);
	}
	
	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회 시작 번호
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회구간의 시작번호
	 */
	public int getBeginIndex() {return (pageNo-1)*rowsPerPage +1; }
	
	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회 시작 번호
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회구간의 끝번호
	 */
	public int getEndIndex() { return pageNo*rowsPerPage; }	
	
	public Integer getPageNo() {
		return pageNo;
	}
	
	public boolean isFirst() {
		return pageNo == 1;
	}
	
	public boolean isLast() {
		return pageNo == getTotalPages();
	}
	public Integer getTotalRows() {
		return totalRows;
	}
	
}
