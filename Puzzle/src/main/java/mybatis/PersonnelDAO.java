package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.PersonnelCommand;

public class PersonnelDAO extends SqlSessionDaoSupport {

	public int insertPC(PersonnelCommand comm){
		return getSqlSession().insert("P_Card.insertCard", comm);
	}
}
