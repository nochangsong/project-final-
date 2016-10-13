package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class LoginDAO extends SqlSessionDaoSupport{
	
	public String lgoincheck(String Email){
		return	getSqlSession().selectOne("loginMP.select", Email);
	}
	
	public String getAuthority(String email){
		return getSqlSession().selectOne("loginMP.getAuthority",email);
	}
}
