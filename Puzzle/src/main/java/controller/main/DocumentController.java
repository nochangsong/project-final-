package controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/user")
public class DocumentController {

	@RequestMapping("/document.do")
	public String docuwrite(){
		return "docuForm";
	}
}
