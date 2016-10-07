package mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.MessageCommand;


public class MessageDAO extends SqlSessionDaoSupport{
	
	public List<MessageCommand> selectNewAlarm(String receiver){
		return getSqlSession().selectList("message.selectNewAlarm", receiver);
	}
	
	public void updateAlarm(MessageCommand message){
		getSqlSession().update("message.updateAlarm", message);
	}
	
	public int selectNewMessageNumber(String receiver){
		return getSqlSession().selectOne("message.selectNewMessageNumber", receiver);
	}
	public void updateRead(MessageCommand msg){
		getSqlSession().update("message.updateRead", msg);
	}
	
	public List<MessageCommand> getAllMessages(HashMap<String,Object> map){
		return getSqlSession().selectList("message.allMessages", map);
	}
	
	public int sendMessage(MessageCommand message) {
		return getSqlSession().insert("message.sendmessage", message);
	}
	
	public MessageCommand getMessage(int no){
		return getSqlSession().selectOne("message.selectMessage", no);
	}
	
	public int getTotalMessageCount(String receiver){
		return getSqlSession().selectOne("message.selectTotalMessageCount", receiver);
	}
	
	public int deleteMessages(int no){
		return getSqlSession().delete("message.deleteMessage", no);
	}
}
