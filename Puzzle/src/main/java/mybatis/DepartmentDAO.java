package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DepartMentCommand;
import model.PositionCommand;

public class DepartmentDAO extends SqlSessionDaoSupport{
	
//	listªÃ±‚
	public List<DepartMentCommand> listdept(){
		return getSqlSession().selectList("dept.selectAlldeptType");
	}
	
	

//	type√ﬂ∞°
	public void insertDeptType(DepartMentCommand command){
		getSqlSession().insert("dept.insert_deptType", command);
	}
	
//	public String selectdeptNum(String string){
//		String dept_Num = getSqlSession().selectOne(string);
//		return dept_Num;		
//	}
//	
	public void updateDeptType(DepartMentCommand command){
		getSqlSession().update("dept.updateDept", command);
	}
	
	public void deleteDeptType(int dept_Num){
		getSqlSession().delete("dept.deleteDept", dept_Num);
	}
}
