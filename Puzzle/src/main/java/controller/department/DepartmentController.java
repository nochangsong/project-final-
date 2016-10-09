package controller.department;

import java.net.URLEncoder;
import java.util.List;
   
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.DepartMentCommand;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin")
public class DepartmentController {
	
	@Autowired
	private DepartmentService service;
	
	public void setService(DepartmentService service) {
		this.service = service;
	}  
	
//	@ModelAttribute("command")
//	public DepartMentCommand fromBacking(){
//		return new DepartMentCommand();
//	}	
	
	@RequestMapping(value="/department/departmentList.puzzle", method=RequestMethod.GET)
	public String dept() throws Exception{
		return "departmentList";
	}
	
	@RequestMapping(value="/department/departmentList.puzzle", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getList(HttpServletResponse resp, String type, String dept_Num, String dept_Type) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		if(type!=null){
			DepartMentCommand command = new DepartMentCommand();
			if(type.equals("insert")){
				command.setDept_Type(dept_Type);
				service.insertDeptType(command);
				
			}else if(type.equals("update")){				
				command.setDept_Num(Integer.parseInt(dept_Num));
				command.setDept_Type(dept_Type);
				service.updateDeptType(command);
				
			}else if(type.equals("delete")){
				service.deleteDeptType(Integer.parseInt(dept_Num));
			}
		}
		
		List<DepartMentCommand> list = service.listdept();
		for(int i=0; i<list.size(); i++){
			list.get(i).setDept_Type(URLEncoder.encode(list.get(i).getDept_Type(),"UTF-8"));
		}
		
		JSONObject json = new JSONObject();
		json.put("list", list);
		return json.toString();
	}
	
/*	public ModelAndView form(@ModelAttribute("com") DepartMentCommand com) throws Exception{
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
	@ResponseBody
	public String update(HttpServletResponse resp, @ModelAttribute("com") DepartMentCommand com) throws IOException{
		resp.setContentType("text/html);charset=utf-8");
		ModelAndView mav = new ModelAndView("department");
		JSONObject json = new JSONObject();
		String dept_Num = service.deptnum();
		mav.addObject("dept_Num", dept_Num);
		
		if(dept_Num != null){
			int a = service.updateDeptType(com);			
			json.put("dept_type", a);		
			resp.setContentType("text/html);charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print(json.toString());
		}
			return json.toString();
		
	}
	
	@RequestMapping("/delete.puzzle")
	public String delete(@RequestParam("num")int dept_Num){
		service.deleteDeptType(dept_Num);
		return "redirect:departmentList.puzzle";
	}*/
	
}
