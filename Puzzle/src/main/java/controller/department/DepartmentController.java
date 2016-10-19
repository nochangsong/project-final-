package controller.department;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String msg = null;
		if(type!=null){
			DepartMentCommand command = new DepartMentCommand();
			if(type.equals("insert")){
				command.setDept_Type(dept_Type);
//				System.out.println("dept_Num : " + dept_Num);
//				System.out.println("dept_Type: " + dept_Type);
				service.insertDeptType(command);
				
			}else if(type.equals("update")){				
				command.setDept_Num(Integer.parseInt(dept_Num));
				command.setDept_Type(dept_Type);
				service.updateDeptType(command);
				
			}else if(type.equals("delete")){
				List<PersonnelCommand> pc=service.memAll();
				for(PersonnelCommand li:pc){
					if(!dept_Num.equals(li.getDept_num())){
						service.deleteDeptType(Integer.parseInt(dept_Num));
					}else{
						msg = "조직원이 존재하는 부서입니다.";
						System.out.println(msg);
					}
				}
				
			}
		}
		
		List<DepartMentCommand> list = service.listdept();
		for(int i=0; i<list.size(); i++){
			list.get(i).setDept_Type(URLEncoder.encode(list.get(i).getDept_Type(),"UTF-8"));
		}
		
		JSONObject json = new JSONObject();
		json.put("list", list);
		json.put("msg", msg);
		return json.toString();
	}

	@RequestMapping(value="/departmemList.puzzle", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String getselect(HttpServletResponse resp, String dept_Type, String search) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		JSONObject json = new JSONObject();
		  
		//검색어가 있으면
		if(search!=null){
//			System.out.println("search :: " + search);
			List<listCommand> list = service.searchMem(search);
//			System.out.println("list.size :: " + list.size());
			for(int i=0; i<list.size(); i++){
				list.get(i).setName(URLEncoder.encode(list.get(i).getName(),"UTF-8"));
				list.get(i).setDept_Type(URLEncoder.encode(list.get(i).getDept_Type(),"UTF-8"));
				list.get(i).setEmail(URLEncoder.encode(list.get(i).getEmail(),"UTF-8"));
				list.get(i).setPositiontype(URLEncoder.encode(list.get(i).getPositiontype(),"UTF-8"));
			}
			json.put("list", list);
			return json.toString();
		}
		
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
		
		List<listCommand> list = service.memList(command);
		for(int i=0; i<list.size(); i++){
			list.get(i).setName(URLEncoder.encode(list.get(i).getName(),"UTF-8"));
			list.get(i).setDept_Type(URLEncoder.encode(list.get(i).getDept_Type(),"UTF-8"));
			list.get(i).setEmail(URLEncoder.encode(list.get(i).getEmail(),"UTF-8"));
		}
//		System.out.println(list.size());
		
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("pageCount", pageCount);
		json.put("pageNum", pageNum);
		json.put("previous", previous);
		json.put("next", next);
		json.put("list", list);
		return json.toString();
		
	}
	
	
	@RequestMapping(value="/checkType.puzzle", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String check_dept_type(HttpServletResponse resp, String dept_Type) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		List<String> list = service.selectdept();
		JSONObject json = new JSONObject();
		int check = 0;
		for(int i=0; i<list.size(); i++){
			if(dept_Type.equals(list.get(i))){
				check++;
			}
		}
		json.put("check",check);
		return json.toString();
	}
	
}
