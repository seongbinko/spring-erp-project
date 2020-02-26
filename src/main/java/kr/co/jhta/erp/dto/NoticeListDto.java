package kr.co.jhta.erp.dto;

import java.util.Date;

import kr.co.jhta.erp.utils.DateUtils;

public class NoticeListDto {

	private int no;
	private int departmentNo;
	private String title;
	private String content;
	private int viewCount;
	private String departmentName;
	private Date noticeDate;
	private String name;
	private String source;
	
	public NoticeListDto () {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFmtDate() {
		return DateUtils.dateToString(noticeDate);
	}

	public int getDepartmentNo() {
		return departmentNo;
	}

	public void setDepartmentNo(int departmentNo) {
		this.departmentNo = departmentNo;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Override
	public String toString() {
		return "NoticeListDto [no=" + no + ", departmentNo=" + departmentNo + ", title=" + title + ", content="
				+ content + ", viewCount=" + viewCount + ", departmentName=" + departmentName + ", noticeDate="
				+ noticeDate + ", name=" + name + ", source=" + source + "]";
	}
	
}
