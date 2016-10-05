package controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.DepterMentCommand;

@Controller
@RequestMapping("/main")
public class MainController {

//	@Autowired
//	private DepterMentCommand com;
	
//	public void setCom(DepterMentCommand com) {
//		this.com = com;
//	}
	
	@ModelAttribute("com")
	public DepterMentCommand formBacking(){
	     return new DepterMentCommand();
	}
	   
	public MainController() {
			// TODO Auto-generated constructor stub
		}

	@RequestMapping("main.puzzle")
	public String main(){
		return "main";
	}
	

	@RequestMapping("/admin.puzzle")
	public String adminlogin(){
		
		return "depterment";
	}
	
	@RequestMapping("/user.puzzle")
	public String userlogin(){
		return "user";
	}
}
