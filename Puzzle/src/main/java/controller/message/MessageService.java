package controller.message;

import java.util.HashMap;
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
	
	public void updateRead(MessageCommand message) {
		try {
			dao.updateRead(message);
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
	
	public List<MessageCommand> getAllMessages(String email, int start, int end) {
		List<MessageCommand> list = null;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("receiver", email);
		map.put("start", start);
		map.put("end", end);
		try {
			list = dao.getAllMessages(map);
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
	
	public int getTotalMessageCount(String email){
		int count = 0;
		try {
			count = dao.getTotalMessageCount(email);
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return count;
	}
	
	public void deleteMessages(int[] no){
		try {
			for(int i=0; i<no.length; i++){
				dao.deleteMessages(no[i]);
			}
		} catch(Exception e){
			System.out.println(e.toString());
		}
	}
}
