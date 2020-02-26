package kr.co.jhta.erp.dao;

import java.util.List;

import kr.co.jhta.erp.dto.MessageDto;

public interface MessageDao {

	List<MessageDto>getMessage(int employeeNo);
	MessageDto detailMessage(int messageNo);
	void sendEmail(MessageDto messageDto);
	void deleteMessage(int messageNo);
	List<MessageDto>sendMessage(int employeeNo);
	void isRead(int messageNo);
	int isReadCount(int empNo);
	int getMessageCount(int empNo);
	int sendMessageCount(int empNo);
}
