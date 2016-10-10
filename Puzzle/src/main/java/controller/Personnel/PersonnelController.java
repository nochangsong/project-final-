package controller.Personnel;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		System.out.println("Ω√¿€");
		return "P_Card_in";
	}
	
	@RequestMapping(value="/P_Card_in.puzzle", method=RequestMethod.POST)
	public String Submit(@ModelAttribute("command")PersonnelCommand command) throws Exception{
		service.insertCard(command);
		System.out.println("≥°");
		return "P_Success";
	}
}
