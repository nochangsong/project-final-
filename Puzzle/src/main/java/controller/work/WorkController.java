package controller.work;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.PositionCommand;
import model.WorkCommand;

@Controller
@RequestMapping("/work")
public class WorkController {
	 @Autowired
	   private WorkService service;
	 
	   public void setService(WorkService service) {
	      this.service = service;
	   }
	   
	   @RequestMapping(value="/workList.puzzle", method=RequestMethod.GET)
	   public String work(){
		   System.out.println("Ω√¿€");
	      return "workList";
	   }

	   @RequestMapping(value="/workList.puzzle",method=RequestMethod.POST)
	   public ModelAndView find_absent(String Name, HttpServletResponse resp){
		   resp.setContentType("text/html; charset=UTF-8");
	      List<WorkCommand> list = service.getWorkList(Name);
//	      System.out.println("list.size::: "+list.size());
	      ModelAndView mav = new ModelAndView("workList");
	      mav.addObject("Name",list);
//	      JSONObject json = new JSONObject();
//	      json.put("list", list);
//	      System.out.println(json);
	      return mav;
	   }


}
