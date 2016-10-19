package controller.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import controller.Personnel.PersonnelService;
import model.DocuBoxCommand;
import mybatis.ConfirmDAO;
import mybatis.PersonnelDAO;

@Controller
public class ConfirmController {
	
	@Autowired
	private ConfirmService dao;
	
	@Autowired
	private PersonnelService dao2;

	public void setDao(ConfirmService dao) {
		this.dao = dao;
	}
	
	public void setDao2(PersonnelService dao2) {
		this.dao2 = dao2;
	}

	@RequestMapping(value="/document/sendDraft.puzzle" ,method=RequestMethod.GET)
	public String sendDraft(HttpServletRequest request){
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		System.out.println(email);
		String FileName = request.getParameter("filename");
		String fileLink = request.getParameter("filelink");
		String Reg_Date = request.getParameter("reg_date");
		String name = dao2.selectName(email);
		DocuBoxCommand command = new DocuBoxCommand();
		command.setEmail(email);
		command.setFileName(FileName);
		command.setPath(fileLink);
		command.setReg_Date(Reg_Date);
		command.setWriter(name);
		dao.insertDraft(command);
		
		
		return "sendDraft";
	}
	
	@RequestMapping("/document/mydocument.puzzle")
	public String myFormView(){
		return "mydocument";
	}

}
