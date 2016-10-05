package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DepterMentCommand;

public class DeptermentDAO extends SqlSessionDaoSupport{
	
	public List<DepterMentCommand> getAllDeptType(){
		return getSqlSession().selectList("dept.allDeptType");
	}

	public int selectdeptNum(){
		return getSqlSession().selectOne("dept.deptnum");
	}
	
//	public String insertDeptType(){
//		return getSqlSession().insert("dept.depttypeadd");
//	}
}
