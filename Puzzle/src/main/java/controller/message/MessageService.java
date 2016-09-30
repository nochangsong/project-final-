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


	public List<MessageCommand> alarmList(){
		List<MessageCommand> list = null;
		try {
			list = dao.selectNewAlarm();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
	
	public void updateAlarm(MessageCommand msg){
		try {
			dao.updateAlarm(msg);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public int getNewMessageNumber(){
		int num = 0;
		try {
			num = dao.selectNewMessageNumber();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return num;
	}
}
