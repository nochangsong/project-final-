package mybatis;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.PersonnelCommand;

public class PersonnelDAO extends SqlSessionDaoSupport {

	public int insertPC(PersonnelCommand comm){
		return getSqlSession().insert("P_Card.insertCard", comm);
	}
	public String select(String Eamil){
		return getSqlSession().selectOne("P_Card.select",Eamil);
	}
	public void update(String Email){
		getSqlSession().update("P_Card.Check",Email);
	}
	public List<PersonnelCommand> selectList(String email){
		return getSqlSession().selectList("P_Card.getPC",email);
	}
	public int updatePC(PersonnelCommand command){
		return getSqlSession().update("P_Card.upcard",command);
	}
}
