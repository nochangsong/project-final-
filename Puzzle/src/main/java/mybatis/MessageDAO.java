package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.MessageCommand;


public class MessageDAO extends SqlSessionDaoSupport{

//	public List<MessageCommand> selectNewAlarm(){
//		return getSqlSession().selectList("alarm.selectNewAlarm");
//	}
//	public void updateAlarm(MessageCommand msg){
//		getSqlSession().update("alarm.alarm", msg);
//	}
//	
//	public int selectNewMessageNumber(){
//		return getSqlSession().selectOne("selectNewMessageNumber");
//	}
//	public void updateRead(MessageCommand msg){
//		getSqlSession().update("alarm.read", msg);
//	}
	
	public List<MessageCommand> getAllMessages(String receiver){
		return getSqlSession().selectList("message.allMessages","joo@naver.com");
	}
}
