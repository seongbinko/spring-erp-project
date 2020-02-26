package kr.co.jhta.erp.vo;

import kr.co.jhta.erp.utils.NumberUtils;

public class ProductPagination {

	private int rowsPerPage;		//한 페이지당 표시할 데이터 행의 개수, 기본값 5
	private int pagesPerPage;		//한 페이지당 표시할 페이지 번호 개수, 기본값 5
	private int pageNo;				//요청한 페이지 번호
	private int totalRows;			//전체 데이터 개수(조회조건을 만족하는)
	
	/**
	 * Pagination객체를 생성
	 * @param pageNo 요청한 페이지 번호
	 * @param totalRows 전체 데이터 개수
	 */
	public ProductPagination(int pageNo, int totalRows) {
		this.rowsPerPage =10;
		this.pagesPerPage =10;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}
	
	/**
	 * Pagination객체를 생성
	 * @param pageNo 요청한 페이지 번호
	 * @param totalRows 전체 데이터 개수
	 * @param rowsPerPage 한 화면에 표시할 행의 개수
	 */
	public ProductPagination(int pageNo, int totalRows, int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerPage =10;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}
	
	/**Pagination객체를 생성
	 * @param pageNo 요청한 페이지 번호
	 * @param totalRows 전체 데이터 개
	 * @param rowsPerPage 한 화면에 표시할 행의 개수
	 * @param pagesPerPage 한 화면에 표시할 페이지 번호 개수
	 */
	public ProductPagination(int pageNo, int totalRows, int rowsPerPage, int pagesPerPage) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerPage = pagesPerPage;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}
	
	/*
	 * 	전체 페이지 개수를 반환
	 * 	@return 총 페이지 개수
	 */
	public int getTotalPageCount() {
		return NumberUtils.ceil(totalRows, rowsPerPage);
	}
	
	/*
	 * 전체 구간 개수를 반환
	 * @return 총 구간 개수
	 */
	public int getTotalBlocksCount() {
		return NumberUtils.ceil(getTotalPageCount(), pagesPerPage);
	}
	
	/*
	 * 요청한 페이지 번호가 속한 현재 구간을 반환
	 * @return 현재구간 번호
	 */
	public int getCurrentBlockNo() {
		return NumberUtils.ceil(pageNo, pagesPerPage);
	}
	
	/*
	 * 페이지 내비게이션의 시작 페이지 번호를 반환
	 * @return 시작 페이지 번호
	 */
	public int getBeginPage() {
		return (getCurrentBlockNo() - 1)*pagesPerPage + 1;
	}
	
	/**
	 * 페이지 네비게이션의 끝 페이지 번호를 반환
	 * @return 끝 페이지 번호
	 */
	public int getEndPage() {
		return (getCurrentBlockNo() == getTotalBlocksCount() ? getTotalPageCount() : getCurrentBlockNo());
	}
	
	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회 시작 번호
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회 구간의 시작 번호
	 */
	public int getBeginIndex() {
		return (pageNo-1)*rowsPerPage +1;
	}
	
	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회 끝 번호
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회 구간의 끝 번호
	 */
	public int getEndIndex() {
		return pageNo*rowsPerPage;
	}
	
	public int getPageNo() {
		return pageNo;
	}
}
