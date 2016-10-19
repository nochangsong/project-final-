package controller.forms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.DocuBoxCommand;
import mybatis.ConfirmDAO;

@Component
public class ConfirmService {

	@Autowired
	private ConfirmDAO dao;

	public void setDao(ConfirmDAO dao) {
		this.dao = dao;
	}
	
	public int insertDraft(DocuBoxCommand command){
		return dao.insertDraft(command);
	}

}
