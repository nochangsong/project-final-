package mybatis;

import java.util.List;

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
	
	public List<MessageCommand> getAllMessages(String receiver){
		return getSqlSession().selectList("message.allMessages", receiver);
	}
	
	public int sendMessage(MessageCommand message) {
		return getSqlSession().insert("message.sendmessage", message);
	}
	
	public MessageCommand getMessage(int no){
		return getSqlSession().selectOne("message.selectMessage", no);
	}
}
