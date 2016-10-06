package controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.PositionCommand;

@Controller
@RequestMapping("/admin")
public class PositionController {

	@Autowired
	private PositionService service;
	public void setService(PositionService service) {
		this.service = service;
	}
	
	@ModelAttribute("positionCommand")
	public PositionCommand positionForm(){
		return new PositionCommand();
	}
	
	@RequestMapping(value="/position/positionList.puzzle", method=RequestMethod.GET)
	public ModelAndView positionList() throws Exception {
		ModelAndView mav = new ModelAndView("positionList");
		List<PositionCommand> list = service.getPositionList();
		mav.addObject("positionList",list);
		return mav;
	}
	
	@RequestMapping(value="/position/positionList.puzzle", method=RequestMethod.POST)
	public String insert(@ModelAttribute("positionCommand")PositionCommand position) throws Exception {
		service.insertPosition(position);
		return "redirect:positionList.puzzle";
	}
	
	@RequestMapping("/position/update.puzzle")
	public String update(@RequestParam("num")int position_num, @RequestParam("type")String positionType){
		PositionCommand position = new PositionCommand();
		position.setPosition_num(position_num);
		position.setPositionType(positionType);
		service.updatePosition(position);
		return "redirect:positionList.puzzle";
	}
	
	@RequestMapping("/position/delete.puzzle")
	public String delete(@RequestParam("num")int position_num){
		service.deletePosition(position_num);
		return "redirect:positionList.puzzle";
	}
}
