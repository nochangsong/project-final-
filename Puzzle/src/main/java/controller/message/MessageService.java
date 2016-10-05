package controller.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.MessageCommand;
import mybatis.MessageDAO;


@Component
public class MessageService {

	@Autowired
	private MessageDAO dao;
	public void setDao(MessageDAO dao) {
		this.dao = dao;
	}


	public List<MessageCommand> getAlarmList(String email){
		List<MessageCommand> list = null;
		try {
			list = dao.selectNewAlarm(email);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
	
	//알람 울림으로
	public void updateAlarm(MessageCommand message){
		try {
			dao.updateAlarm(message);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public int getNewMessageNumber(String email){
		int num = 0;
		try {
			num = dao.selectNewMessageNumber(email);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return num;
	}
	
	public List<MessageCommand> getAllMessages(String email) {
		List<MessageCommand> list = null;
		try {
			list = dao.getAllMessages(email);
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}
	
	public int send(MessageCommand message){
		int result = 0;
		try {
			result = dao.sendMessage(message);
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}
	
	public MessageCommand getMessage(int no) {
		MessageCommand message = null;
		try {
			message = dao.getMessage(no);
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return message;
	}
}
