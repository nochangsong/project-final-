package controller.depterment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.DepterMentCommand;

@Controller
@RequestMapping("/depterment")
public class DeptermentController {
	
	private DeptermentService service;

	@Autowired
	public void setService(DeptermentService service) {
		this.service = service;
	}
	
	@RequestMapping("deptermentList.puzzle")
	public ModelAndView submit() throws Exception{
		ModelAndView mav = new ModelAndView("deptermentList");
		List<DepterMentCommand> list = service.DeptTypeList();
		mav.addObject("dept_type", list);
		
		return mav;
	}
	

}
