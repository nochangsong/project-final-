package controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

	@RequestMapping("/main.puzzle")
	public String main(){
		return "main";
	}
	

	@RequestMapping("/admin.puzzle")
	public String adminlogin(){
		return "member";
	}
	
	@RequestMapping("/user.puzzle")
	public String userlogin(){
		return "user";
	}
}
