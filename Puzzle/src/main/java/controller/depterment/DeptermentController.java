package controller.depterment;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.DepterMentCommand;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/depterment")
public class DeptermentController {
	
	private DeptermentServiceImpl service;

	@Autowired
	public void setService(DeptermentServiceImpl service) {
		this.service = service;
	}
	
	@RequestMapping(value="/deptermentList.puzzle", method=RequestMethod.GET)
	public ModelAndView form(@ModelAttribute("com") DepterMentCommand com) throws Exception{
		ModelAndView mav = new ModelAndView("depterment");
		List<DepterMentCommand> list = service.listdept();
		mav.addObject("dept_type", list);
		
		return mav;
	}
		
//	@RequestMapping(value="/deptermentList.puzzle", method=RequestMethod.POST)
//	public ModelAndView insert(@ModelAttribute("com") DepterMentCommand com)throws Exception{
//		ModelAndView mav = new ModelAndView("depterment");
//		service.insertDeptType(com);
//		
//		return mav;
		
		
	@RequestMapping("/deptermentList.puzzle")
	@ResponseBody
	public String insert(HttpServletResponse resp, @ModelAttribute ("com") DepterMentCommand com)throws Exception{
		resp.setContentType("text/html);charset=utf-8");
		int a = service.insertDeptType(com);
		JSONObject json = new JSONObject();
		json.put("dept_type", a);
		
		resp.setContentType("text/html);charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toString());

		
		return json.toString();
		
		
		}
//		return mav;
//		List<String> list = servicec.listdept();
//		JSONObject jso = new JSONObect();
//		jso.put("data", list);
//		
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter out = resp.getWriter();
//		out.print(jso.toString());


	@RequestMapping("insertDeptType.puzzle")
	public ModelAndView insertDeptType(@ModelAttribute("com")DepterMentCommand com) throws Exception{
		ModelAndView mav = new ModelAndView("insertDeptType");
		
		return mav;
	}

}
