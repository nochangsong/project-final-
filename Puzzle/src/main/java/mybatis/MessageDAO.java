package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.MessageCommand;


public class MessageDAO extends SqlSessionDaoSupport{
	
	public List<MessageCommand> selectNewAlarm(String receiver){
		return getSqlSession().selectList("message.selectNewAlarm", receiver);
	}
	public void updateAlarm(MessageCommand msg){
		getSqlSession().update("message.updateAlarm", msg);
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
}
