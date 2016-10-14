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
@RequestMapping("/admin")
public class DepartmentController {
	
	@Autowired
	private DepartmentService service;
	
	public DepartmentService getService() {
		return service;
	}


	public void setService(DepartmentService service) {
		this.service = service;
	}  
	
//	private int perPage = 6;
	
/*	ModelAndView mav = null;
	
	@RequestMapping("departmentList.puzzle")
	   public ModelAndView list() throws Exception {
	      List<PersonnelCommand> list = null;

	      mav = new ModelAndView("nlist");
	      int pageNum = 1;
	      int pagesize = 6;
	      Map<String, Object> map = new HashMap<String, Object>();

	      int startRow = (pageNum * 10) - 9;
	      int endRow = (pageNum * pagesize);
	      map.put("startRow", startRow);
	      map.put("endRow", endRow);

	      int cnt = service.getTotalCount(); // 전체 글 갯수
	      // cnt(전체 글 갯수가)가 0이면 저장된 글 없음
	      if (cnt > 0) {
	         list = service.memAll();
	      }

	      *//**** 페이지 수 연산 ****//*
	      int pageCount = cnt / pagesize + (cnt % pagesize == 0 ? 0 : 1);
	      int startPage = (int) (pageNum / 5) * 5 + 1;
	      int pageBlock = 5;
	      int endPage = startPage + pageBlock - 1;
	      if (endPage > pageCount)
	         endPage = pageCount;

	      mav.addObject("pageNumber", pageNum); // 페이지 번호
	      mav.addObject("totalcnt", cnt); // 전체 글 수
	      mav.addObject("pageCount", pageCount); // 페이지 수
	      mav.addObject("startPage", startPage); // 시작 페이지
	      mav.addObject("endPage", endPage); // 끝 페이지
	      mav.addObject("list", list);

	      return mav;
	   }*/
	
	
/*	@RequestMapping(value="departmentList.puzzle", method=RequestMethod.GET)
	public ModelAndView getList(@RequestParam(value="pageNum", defaultValue = "1")int pageNum) throws Exception {
		ModelAndView mav = new ModelAndView("departmentList");
		
		int totalCount = service.getTotalCount();
		int pageCount = totalCount/perPage+(totalCount%perPage==0?0:1);
		int start = totalCount-perPage*(pageNum-1); 
		int end = (start-perPage)+1 > 0 ? (start-perPage)+1 : 1; 
		int previous = (pageNum-5)/5*5+1;
		int next = (pageNum/5+1)*5+1;
		
//		int start = perPage*(pageNum-1)+1;
//		int end = start+(perPage-1);
		
		List<PersonnelCommand> list = service.memAll();
		
		mav.addObject("pageCount", pageCount);
		mav.addObject("pageNum", pageNum);
		mav.addObject("previous", previous);
		mav.addObject("next", next);
		mav.addObject("mem", list);
		return mav;
	}*/
	
	
	@RequestMapping(value="/department/departmentList.puzzle", method=RequestMethod.GET)
	public ModelAndView dept() throws Exception{
		ModelAndView mav =new ModelAndView("departmentList");
		List<listCommand> list = service.selectAll();
		mav.addObject("mem", list);
		return mav;
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

	@RequestMapping(value="/department/departmemList.puzzle", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String getselect(HttpServletResponse resp, String dept_Type) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");

		listCommand command = new listCommand();
		command.setDept_Type(dept_Type);
				
		List<listCommand> list = service.memList(command);
		for(int i=0; i<list.size(); i++){
			list.get(i).setName(URLEncoder.encode(list.get(i).getName(),"UTF-8"));
			list.get(i).setDept_Type(URLEncoder.encode(list.get(i).getDept_Type(),"UTF-8"));
//			list.get(i).setAuthority(URLEncoder.encode(list.get(i).getAuthority(),"UTF-8"));
		}
		System.out.println(list.size());		
		JSONObject json = new JSONObject();
		json.put("list", list);
		return json.toString();
		
	}
}
