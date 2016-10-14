package controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.LoginDAO;

@Component
public class LoginService {
	
	@Autowired
	private LoginDAO dao;

	public void setDao(LoginDAO dao) {
		this.dao = dao;
	}
	
	public String loginselect(String email){
		String getEmail = null;
		try{
			getEmail = dao.lgoincheck(email);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return getEmail;
	}
	
	public String getAuthority(String email){
		String authority = "";
		try {
			authority = dao.getAuthority(email);
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return authority;
	}
	
}
