package controller.Personnel;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.PersonnelCommand;

@Controller
@RequestMapping("/PersonnelView")
public class PersonnelController {
	
	@Autowired
	private PersonnelService serivce;
	
	
	public void setService(PersonnelService service){
		this.serivce = service;
	}
	
	@RequestMapping(value="P_Card_in.puzzle", method=RequestMethod.GET)
	public String WriteCard() throws Exception{
		return "P_Card_in";
	}
	
	@RequestMapping(value="P_Card_in.puzzle", method=RequestMethod.POST)
	public String CardList(@ModelAttribute("Prcommand")PersonnelCommand PrCommand) throws Exception{
		serivce.insertCard(PrCommand);
		return "P_Success";
	}
}
