package controller.Personnel;

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
}
