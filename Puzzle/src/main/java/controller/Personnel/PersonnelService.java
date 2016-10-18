package controller.Personnel;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.PersonnelCommand;
import mybatis.PersonnelDAO;

@Component
public class PersonnelService { 

	@Autowired
	private PersonnelDAO dao;
	
	public void setDAO(PersonnelDAO dao){
		this.dao = dao;
	}
	
	public int insertCard(PersonnelCommand PrCommand){
		int Card= 0;
		try{
			Card = dao.insertPC(PrCommand);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return Card;
	}
	public void updateCard(String email){
		try{
		     dao.update(email);
		}catch(Exception e){
			System.out.println(e.toString());
		}
	}
	public String select(String email){
		String SeEm = null;
		try{
			SeEm = dao.select(email);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return SeEm;
	}
	
	public List<PersonnelCommand> getlist(PersonnelCommand command,String Email){
		List<PersonnelCommand> list = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", command);
		map.put("Email", Email);
		try{
			list = dao.selectList(map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}

}
