package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.CompanyCommand;

public class CompanyDAO extends SqlSessionDaoSupport{

	public CompanyCommand getCompanyInfo(String com_ceo){
		return getSqlSession().selectOne("company.companyInfo", com_ceo);
	}
	
	public void setLogo(CompanyCommand company){
		getSqlSession().update("company.setLogo", company);
	}
}
