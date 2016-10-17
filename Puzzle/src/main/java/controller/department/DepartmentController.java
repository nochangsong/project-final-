package controller.department;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.DepartMentCommand;
import model.MessageCommand;
import model.PersonnelCommand;
import model.listCommand;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	@Autowired
	private DepartmentService service;
	
	public DepartmentService getService() {
		return service;
	}


	public void setService(DepartmentService service) {
		this.service = service;
	}  
	
	private int perPage = 6;
	
	
	@RequestMapping(value="/departmentList.puzzle", method=RequestMethod.GET)
	public ModelAndView dept(@RequestParam(value="pageNum", defaultValue = "1")int pageNum) throws Exception{
		ModelAndView mav =new ModelAndView("departmentList");
		
		
		int totalCount = service.getTotalCount();  //8
		int pageCount = totalCount/perPage+(totalCount%perPage==0?0:1); //2

		int start = perPage*(pageNum-1)+1; 

		int end = start+(perPage-1) > totalCount ? totalCount : start+(perPage-1);  //6
		
		int startPage = (pageNum-1) / 5 * 5 + 1; //1
		int endPage = startPage + 5 - 1; //5
		if(endPage>pageCount){
			endPage=pageCount;
		}
		
		int previous = (pageNum-5)/5*5+1;
		int next = (pageNum/5+1)*5+1;
		
		List<listCommand> list = service.selectAll();
		mav.addObject("mem", list);
		
		System.out.println("totalCount1 : " + totalCount);
		System.out.println("pageCount1 :"+ pageCount);
		System.out.println("start1 : " + start);
		System.out.println("end1 : " + end);
		System.out.println("pageNum1 : " +pageNum);
		System.out.println("startPage1 : " +startPage);
		System.out.println("endPage1 : " + endPage);
		
		mav.addObject("startPage1",startPage);
		mav.addObject("endPage1",endPage);
		mav.addObject("pageCount1", pageCount);
		mav.addObject("pageNum1", pageNum);
		mav.addObject("previous1", previous);
		mav.addObject("next1", next);
		
		return mav;

	}
	
	@RequestMapping(value="/departmentList.puzzle", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
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

	@RequestMapping(value="/departmemList.puzzle", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String getselect(HttpServletResponse resp, String dept_Type) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");

		listCommand command = new listCommand();
		command.setDept_Type(dept_Type);
		int pageNum =1;
		
		List<listCommand> dept = service.deptTypeint(command);
		int totalCount = dept.size();
		
		int pageCount = totalCount/perPage+(totalCount%perPage==0?0:1);
		int start = totalCount-perPage*(pageNum-1); 
		int end = (start-perPage)+1 > 0 ? (start-perPage)+1 : 1; 
		
		int startPage = (pageNum-1) / 5 * 5 + 1; //1
		int endPage = startPage + 5 - 1; //5
		if(endPage>pageCount){
			endPage=pageCount;
		}
		
		int previous = (pageNum-5)/5*5+1;
		int next = (pageNum/5+1)*5+1;
		
		System.out.println("totalCount2 : " + totalCount);
		System.out.println("pageCount2 :"+ pageCount);
		System.out.println("start2 : " + start);
		System.out.println("end2 : " + end);
		System.out.println("pageNum2 : " +pageNum);
		
		List<listCommand> list = service.memList(command);
		for(int i=0; i<list.size(); i++){
			list.get(i).setName(URLEncoder.encode(list.get(i).getName(),"UTF-8"));
			list.get(i).setDept_Type(URLEncoder.encode(list.get(i).getDept_Type(),"UTF-8"));
//			list.get(i).setAuthority(URLEncoder.encode(list.get(i).getAuthority(),"UTF-8"));
		}
		System.out.println(list.size());		
		JSONObject json = new JSONObject();
		

		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("pageCount", pageCount);
		json.put("pageNum", pageNum);
		json.put("previous", previous);
		json.put("next", next);
		json.put("list", list);
		return json.toString();
		
	}
}
