package controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class DocumentController {

	@RequestMapping("/document.puzzle")
	public String docuform(){
		return "docuForm";
	}
	
	@RequestMapping("/document/docuWrite.puzzle")
	public String docuwrite(){
		return "docuWrite";
	}
}
