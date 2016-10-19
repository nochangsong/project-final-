package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.DocuBoxCommand;

public class ConfirmDAO extends SqlSessionDaoSupport{
	
	public int insertDraft(DocuBoxCommand command){
		return getSqlSession().insert("Docu.draftin", command);
	}

}
