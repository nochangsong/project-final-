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
	
	@RequestMapping("/document/myWriteForm.puzzle")
	public String viewDraft(){
		return "myWriteForm";
	}
	
	@RequestMapping("/document/freeDraft.puzzle")
	public String freeDraft(){
		return "freeDraft";
	}
	
	@RequestMapping("/document/checkDoc.puzzle")
	public String checkDoc(){
		return "checkDoc";
	}
	
	
}
