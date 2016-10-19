package controller.forms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.DocuBoxCommand;
import mybatis.ConfirmDAO;
import mybatis.PersonnelDAO;

@Component
public class ConfirmService {

	@Autowired
	private ConfirmDAO dao;
	
	@Autowired PersonnelDAO dao2;

	public void setDao(ConfirmDAO dao) {
		this.dao = dao;
	}
	
	public int insertDraft(DocuBoxCommand command){
		return dao.insertDraft(command);
	}
	
	public String selectName(String email){
		
		return dao2.selectName(email);
	}

}
