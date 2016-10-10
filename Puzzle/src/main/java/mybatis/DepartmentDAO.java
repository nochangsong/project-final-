package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DepartMentCommand;
import model.PositionCommand;

public class DepartmentDAO extends SqlSessionDaoSupport{
	
//	listªÃ±‚
	public List<DepartMentCommand> getListData(String string){
		List<DepartMentCommand> dept_type = getSqlSession().selectList(string);
		return dept_type;
	}
	
	

//	type√ﬂ∞°
	public int insertDeptType(DepartMentCommand com){
		return getSqlSession().insert("dept.dept_typeAdd", com);
	}
	
	public String selectdeptNum(String string){
		String dept_Num = getSqlSession().selectOne(string);
		return dept_Num;		
	}
	
	public int updateDeptType(DepartMentCommand com){
		return getSqlSession().update("dept.updateDept", com);
	}
	
	public void deleteDeptType(int dept_Num){
		getSqlSession().delete("dept.deleteDept", dept_Num);
	}
}
