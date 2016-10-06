package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DepterMentCommand;

public class DeptermentDAO extends SqlSessionDaoSupport{
	
//	listªÃ±‚
	public List<DepterMentCommand> getListData(String string){
		List<DepterMentCommand> dept_type = getSqlSession().selectList(string);
		return dept_type;
	}

//	type√ﬂ∞°
	public int insertDeptType(DepterMentCommand com){
		return getSqlSession().insert("dept.dept_typeAdd", com);
	}
	
}
