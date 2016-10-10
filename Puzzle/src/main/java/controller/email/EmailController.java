package controller.email;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.EmailCommand;

@Controller
@RequestMapping("/EmailSend")
public class EmailController {
	
	@Autowired
	private EmailService service;
	
	@ModelAttribute("command")
	public EmailCommand getCommand(){
		return new EmailCommand();
	}     
	
	@RequestMapping(value="/P_Card_in.puzzle", method=RequestMethod.GET)
	public String WriteCard() throws Exception{
		System.out.println("Ω√¿€");
		return "P_Card_in";
	}
	
	@RequestMapping(value="/P_Card_in.puzzle", method=RequestMethod.POST)
	public String Submit(@ModelAttribute("command")EmailCommand command) throws Exception{
		service.insertCard(command);
		System.out.println("≥°");
		return "P_Success";
	}

}
