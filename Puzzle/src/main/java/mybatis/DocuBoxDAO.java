package mybatis;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DocuBoxCommand;

public class DocuBoxDAO extends SqlSessionDaoSupport{

	public List<DocuBoxCommand> selectListAll(HashMap<String,Object> Map){
		return getSqlSession().selectList("Docu.selectAll", Map);
	}
	public List<DocuBoxCommand> selectListFN(HashMap<String,Object> Map){
		return getSqlSession().selectList("Docu.selectFN", Map);
	}
	public List<DocuBoxCommand> selectListPG(HashMap<String,Object> Map){
		return getSqlSession().selectList("Docu.selectPG", Map);
	}
	public List<DocuBoxCommand> selectListRB(HashMap<String,Object> Map){
		return getSqlSession().selectList("Docu.selectRB", Map);
	}
	public int getTotalCount(int num){
		return getSqlSession().selectOne("Docu.selectCount", num);
	}
}
