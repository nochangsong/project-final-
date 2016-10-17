package mybatis;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DocuBoxCommand;

public class DocuBoxDAO extends SqlSessionDaoSupport{

	public List<DocuBoxCommand> selectList(HashMap<String,Object> Map){
		return getSqlSession().selectList("Docu.selectAll", Map);
	}
	public int getTotalCount(int num){
		return getSqlSession().selectOne("Docu.selectCount", num);
	}
}
