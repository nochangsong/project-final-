package controller.Persnnel;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProsnnelCommand;

@Controller
@RequestMapping("/P_Card_in")
public class ProsnnelController {

	private ProsnnelService serivce;
	
	@Autowired
	public void setService(ProsnnelService service){
		this.serivce = service;
	}
	
	@RequestMapping(value="P_Card_in.puzzle", method=RequestMethod.GET)
	public String WriteCard() throws Exception{
		return "P_Card_in";
	}
	
	@RequestMapping(value="P_Card_in.puzzle", method=RequestMethod.POST)
	public String CardList(ProsnnelCommand Prcommand, HttpServletResponse resp)throws Exception{
		
		
		return "P_Success";
	}
}
