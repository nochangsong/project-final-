package controller.calendar;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.CalendarCommand;
import mybatis.CalendarDAO;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

//	private String userEmail = "joo@naver.com";
	
	@Autowired
	private CalendarDAO service;
	public void setService(CalendarDAO service) {
		this.service = service;
	}
	
	@RequestMapping("/calendarList.puzzle")
	public String list() throws Exception {
		return "calendarList";
	}
	
	@RequestMapping(value= "/getSchedules.puzzle", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getSchedules(HttpServletResponse resp, HttpServletRequest request) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		
		String userEmail = (String)request.getSession().getAttribute("email");
		List<CalendarCommand> list = service.getSchedules(userEmail);
		
		List l = new ArrayList();
		for(int i=0; i<list.size(); i++){
			Map map = new HashMap();
			map.put("no", list.get(i).getNo());
			map.put("type", list.get(i).getType());
			map.put("title", list.get(i).getContent());
			map.put("start", list.get(i).getStartDate());
			map.put("end", list.get(i).getEndDate());
			if(list.get(i).getType().equals("p")){
				map.put("color", "blue");
			} else if(list.get(i).getType().equals("s")){
				map.put("color", "red");
			}
			l.add(map);
		}
		JSONObject json = new JSONObject();
		json.put("list", l);
//		System.out.println(json);
		return json.toString();
	}  
	
	@ModelAttribute("calendarCommand")
	public CalendarCommand getCommand(){
		return new CalendarCommand();
	}
	
	@RequestMapping(value="/insertSchedule.puzzle", method=RequestMethod.POST)
	public String insertSchedule(CalendarCommand calendarCommand, HttpServletRequest request) throws Exception{
		String userEmail = (String)request.getSession().getAttribute("email");
		calendarCommand.setEmail(userEmail);
		service.insertSchedule(calendarCommand);
		return "redirect:calendarList.puzzle";
	}
	
	@RequestMapping(value="/modifySchedule.puzzle", method=RequestMethod.POST)
	public String modifySchedule(CalendarCommand calendarCommand) throws Exception{
		service.modifySchedule(calendarCommand);
		return "redirect:calendarList.puzzle";
		
	}
	
	@RequestMapping("/deleteSchedule.puzzle")
	public String deleteSchedule(int no) throws Exception{
		service.deleteSchedule(no);
		return "redirect:calendarList.puzzle";
	}
	
	@ModelAttribute
	@DateTimeFormat(pattern="yyyy-mm-dd")
	public Date getDate(){
		return new Date();
	}
	
}
