package controller.Personnel;


import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.DocuBoxCommand;
import model.PersonnelCommand;

@Controller
@RequestMapping("/PersonnelView")
public class PersonnelController {
	
	@Autowired
	private PersonnelService service;

	public void setService(PersonnelService service){
		this.service = service;
	}
	
	@ModelAttribute("command")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public PersonnelCommand getCommand(){
		return new PersonnelCommand();
	}
	
	@RequestMapping(value="/P_Card_in.puzzle", method=RequestMethod.GET)
	public String WriteCard() throws Exception{
		return "P_Card_in";
	}
	
	@RequestMapping(value="/P_Card_in.puzzle", method=RequestMethod.POST)
	public String Submit(@ModelAttribute("command")PersonnelCommand command) throws Exception{
		SendEamil se = new SendEamil();
		command.setRandomcode(String.valueOf(System.currentTimeMillis()));
		se.sendCode(command.getEmail(), command.getRandomcode());
		service.insertCard(command);
		return "P_Success";
	}
	
	@RequestMapping(value="/CertifyCheck.puzzle", method=RequestMethod.GET)
	public String StartCheck()throws Exception{
		return "CertifyCheck";
	}
	
	@RequestMapping(value="/CertifyCheck.puzzle", method=RequestMethod.POST)
	public String SubChaeck(HttpServletRequest request) throws Exception{
		String SeEm = request.getParameter("email");
		String random = request.getParameter("certify");
		String ra = service.select(SeEm);

		if(ra.equals(random)){
		service.updateCard(SeEm); 
		}else{
		return "Certifyfail";
		}
		return "CertifySuccess";
	}
 
	
	@RequestMapping(value="/P_Modify.puzzle", method=RequestMethod.GET)
	public ModelAndView Modichange(HttpServletRequest reqeust,String eamil)throws Exception{
		String email = (String)reqeust.getParameter("chkemail");
		System.out.println("chkemail:::"+email);
		
		ModelAndView mv = new ModelAndView("P_Modify");
		List<PersonnelCommand> list = service.getlist(email);
		for(PersonnelCommand dn:list){
			System.out.println(dn.getEmail()+","+dn.getName());
		}
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="/P_Modify.puzzle", method=RequestMethod.POST)
	public String updateModi(@ModelAttribute("command")PersonnelCommand command)throws Exception{
		service.updateCard(command);
		return "P_Success";
	}
}
