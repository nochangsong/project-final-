package controller.forms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FormsController {
	
	
	@RequestMapping("/document/lately.puzzle")
	public String latelyForm(){
		
		return "latelyForm";
	}
	
	@RequestMapping("/document/freeDraft.puzzle")
	public String freeDraft(){
		return "freeDraft";
	}
	
	@RequestMapping("/document/myWriteForm.puzzle")
	public String viewDraft(){
		return "myWriteForm";
	}
	
	@RequestMapping("/document/checkDoc.puzzle")
	public String checkDoc(){
		return "checkDoc";
	}
	
	@RequestMapping("/document/shareForm.puzzle")
	public String shareForm(){
		return "shareForm";
	}

}
