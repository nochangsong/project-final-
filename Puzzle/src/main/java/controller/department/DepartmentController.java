package controller.department;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.DepartMentCommand;
import model.PositionCommand;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	private DepartmentServiceImpl service;

	@Autowired
	public void setService(DepartmentServiceImpl service) {
		this.service = service;
	}  
	
	@RequestMapping(value="/departmentList.puzzle", method=RequestMethod.GET)
	public ModelAndView form(@ModelAttribute("com") DepartMentCommand com) throws Exception{
		ModelAndView mav = new ModelAndView("department");
		List<DepartMentCommand> list = service.listdept();
		mav.addObject("dept_type", list);
		
		return mav;
	}
		
	@RequestMapping("/departmentList.puzzle")
	@ResponseBody
	public String insert(HttpServletResponse resp, @ModelAttribute ("com") DepartMentCommand com)throws Exception{
		resp.setContentType("text/html);charset=utf-8");
		int a = service.insertDeptType(com);
		JSONObject json = new JSONObject();
		json.put("dept_type", a);
		
		resp.setContentType("text/html);charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toString());
		
		return json.toString();
		
	}

	@RequestMapping("/update.puzzle")
	public String update(@RequestParam("num")int dept_Num, @RequestParam("type")String dept_Type){
		DepartMentCommand depterment = new DepartMentCommand();
		depterment.setDept_Num(dept_Num);
		depterment.setDept_Type(dept_Type);
		service.updateDeptType(depterment);;
		return "redirect:departmentList.puzzle";
	}
	
	@RequestMapping("/delete.puzzle")
	public String delete(@RequestParam("num")int dept_Num){
		service.deleteDeptType(dept_Num);
		return "redirect:departmentList.puzzle";
	}
	
}
