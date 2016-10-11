package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.WorkCommand;

public class WorkDAO extends SqlSessionDaoSupport{
	
	public List<WorkCommand> selectWorkList(String name){
		 System.out.println("DAO : " + name);
	      return getSqlSession().selectList("work.dataSearch",name);
	   }
}
