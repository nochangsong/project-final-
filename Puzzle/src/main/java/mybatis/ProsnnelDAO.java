package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.ProsnnelCommand;

public class ProsnnelDAO extends SqlSessionDaoSupport {

	public int insertPC(ProsnnelCommand comm){
		return getSqlSession().insert("P_Card.insertCard", comm);
	}
}
