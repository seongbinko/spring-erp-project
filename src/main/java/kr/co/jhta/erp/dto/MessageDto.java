package kr.co.jhta.erp.dto;

import java.util.Date;

public class MessageDto {

	private int no;//
	private int senderNo;//
	private String isRead;//
	private String content;
	private Date messageDate;//
	private int receiverNo;
	private String senderName;//
	private String receiverName;
	
	public MessageDto() {}

	@Override
	public String toString() {
		return "MessageDto [no=" + no + ", senderNo=" + senderNo + ", isRead=" + isRead + ", content=" + content
				+ ", messageDate=" + messageDate + ", receiverNo=" + receiverNo + ", senderName=" + senderName
				+ ", receiverName=" + receiverName + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	
}
