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
	public PersonnelCommand selectList(String email){
		
		return getSqlSession().selectOne("P_Card.getPC",email);
	}
	public int updatePC(PersonnelCommand command){
		return getSqlSession().update("P_Card.upcard",command);
	}
	
	public String selectName(String email){
		return getSqlSession().selectOne("P_Card.findname", email);
	}
	public void delCard(String email){
		getSqlSession().delete("P_Card.delcard",email);
	}
}
