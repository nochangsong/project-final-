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
	
}
