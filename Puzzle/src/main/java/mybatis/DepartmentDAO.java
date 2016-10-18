package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DepartMentCommand;
import model.PersonnelCommand;
import model.PositionCommand;
import model.listCommand;

public class DepartmentDAO extends SqlSessionDaoSupport{
	
//	list뽑기
	public List<DepartMentCommand> listdept(){
		return getSqlSession().selectList("dept.selectAlldeptType");
	}
	
	

//	type추가
	public List<String> selectdept(){
		return getSqlSession().selectList("dept.selectdept");
	}
	
	public void insertDeptType(DepartMentCommand command){
		getSqlSession().insert("dept.insert_deptType", command);
	}

	public void updateDeptType(DepartMentCommand command){
		getSqlSession().update("dept.updateDept", command);
	}
	
	public void deleteDeptType(int dept_Num){
		getSqlSession().delete("dept.deleteDept", dept_Num);
	}
	
//	조직원 구성 정보에 대한 쿼리 
	public List<listCommand> listAll(){
		List<listCommand> list = getSqlSession().selectList("dept.selectAll");
/*		System.out.println("dao " + list.size());
		
		for(listCommand li:list){
			System.out.println(li.getName());
		}*/
		return list;
	}
	
	public List<PersonnelCommand> workAll(){
		return getSqlSession().selectList("dept.workAll");
	}
	
	public List<PersonnelCommand> timeoffAll(){
		return getSqlSession().selectList("dept.timeoffAll");
	}
	
	public List<PersonnelCommand> resignAll(){
		return getSqlSession().selectList("dept.resignAll");
	}
	
	public List<listCommand> detpTypeList(listCommand command){
		return getSqlSession().selectList("dept.detpTypeList",command);
	}
	
	public List<listCommand> deptTypeint(listCommand command){
		return getSqlSession().selectList("dept.deptTypeint",command);
	}
	
	public int getTotalCount(){
		return getSqlSession().selectOne("dept.getTotalCount");
	}
	
	public List<PersonnelCommand> memAll(){
		return getSqlSession().selectList("dept.memAll");
	}
	
	public List<listCommand> searchMem(String search){
		return getSqlSession().selectList("dept.searchmem", search);
	}
	
}
