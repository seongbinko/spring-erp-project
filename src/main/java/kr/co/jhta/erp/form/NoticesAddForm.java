package kr.co.jhta.erp.form;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticesAddForm {

	private int no;
	private String title;
	private String content;
	private int deptNo;
	private int empNo;
	private Date noticeDate;
	private int viewCount;
	private MultipartFile source;
	

	public NoticesAddForm() {}
	
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
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public MultipartFile getSource() {
		return source;
	}
	public void setSource(MultipartFile source) {
		this.source = source;
	}

	@Override
	public String toString() {
		return "NoticesAddForm [no=" + no + ", title=" + title + ", content=" + content + ", deptNo=" + deptNo
				+ ", empNo=" + empNo + ", noticeDate=" + noticeDate + ", viewCount=" + viewCount + ", source=" + source
				+ "]";
	}
	
}
