package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.EmailCommand;

public class EmailDAO extends SqlSessionDaoSupport{
	
	public int insertEm(EmailCommand comm){
		System.out.println("DAO");
		return getSqlSession().insert("P_Card.insertCard", comm);
	}

}
