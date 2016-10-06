package controller.Persnnel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.ProsnnelDAO;

@Component
public class ProsnnelService {

	@Autowired
	private ProsnnelDAO dao;
	
	public void setDAO(ProsnnelDAO dao){
		this.dao = dao;
	}
	
	public String a(){
		return"";
	}
	
}
